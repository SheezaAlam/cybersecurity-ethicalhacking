

# CSRF & XSS 

## 1. Quick definitions

**CSRF (Cross-Site Request Forgery)**
An attack that tricks a logged-in user’s browser into sending a forged request to a trusted site (where the user is authenticated), causing unintended actions (transfer money, change email, etc.). The attacker **leverages the victim’s session** (cookies, auth tokens) — the request looks legitimate to the server.

**XSS (Cross-Site Scripting)**
An attack that injects malicious script into web pages viewed by other users. The malicious script runs in victims’ browsers with their privileges and can steal cookies, perform actions, or spread itself (stored XSS → worms).

---

## 2. How they differ

* **CSRF**: attacker **forces** the victim’s browser to send a request (uses victim’s credentials).
* **XSS**: attacker **injects** and **runs** code in the victim’s browser (attacker-controlled script).

---

## 3. Typical real examples

**CSRF**

* A hidden auto-submitted form on attacker.com posts to `bank.com/transfer` while the user is logged into bank.com → funds transferred.
* Forged link: `<img src="https://bank.com/transfer?amount=1000&to=attacker" />`

**XSS**

* Stored XSS: attacker posts `<script>fetch('/cookie').then(...)</script>` into a comment; everyone viewing it executes the script.
* Reflected XSS: `https://site.com/search?q=<script>...` → server reflects the query into page without escaping.

---

## 4. Why both are dangerous

* **CSRF**: attacker acts as the victim (bank transactions, change email/password) without reading responses.
* **XSS**: attacker runs arbitrary JavaScript in victims’ browsers — can read cookies, modify page, perform actions, pivot to other attacks (CSRF tokens theft if available in JS).

---

## 5. Core defenses — CSRF (practical)

1. **CSRF Tokens (recommended)**

   * Server generates a random token per session/page; include it in forms and verify on submit. Token must be unpredictable and bound to the user session.
   * Check both session cookie and CSRF token on sensitive requests.

   **Example (Flask-like pseudocode):**

   ```python
   # generate on login/page render
   session['csrf'] = secrets.token_hex(16)
   # in HTML form
   <input type="hidden" name="csrf" value="{{ session.csrf }}">
   # on POST
   if request.form['csrf'] != session['csrf']: abort(403)
   ```

2. **SameSite cookies**

   * Set `Set-Cookie: sessionid=...; SameSite=Lax` or `SameSite=Strict` to limit sending cookies on cross-site requests.

3. **Referrer/Origin header checks (supplementary)**

   * Verify `Origin` or `Referer` headers for POST requests. Do not rely solely on these (some browsers/clients omit them).

4. **Avoid unsafe state-changing GETs**

   * Use POST (or better: require token) for actions that change server state.

5. **Double-submit cookie (if needed)**

   * Cookie + token in request body both required and validated.

6. **Don't allow credentials in URLs**

   * Avoid sensitive actions via GET-query params; use forms and tokens.

---

## 6. Core defenses — XSS (practical)

1. **Context-aware output encoding/escaping (primary defense)**

   * Escape user data based on where it is rendered:

     * HTML body: escape `<`, `>`, `&`, `"` → `&lt;`, `&gt;`, `&amp;`, `&quot;`
     * HTML attribute: additionally escape quotes
     * JavaScript context: JSON-encode and escape, avoid injecting into scripts
     * URL context: percent-encode

   Use framework/template engine auto-escaping (Django, Rails, etc.).

2. **Content Security Policy (CSP)**

   * Add strict CSP headers to restrict script sources and disable inline scripts where possible.
   * Example: `Content-Security-Policy: default-src 'self'; script-src 'self' https://trusted.cdn.com; object-src 'none';`

3. **Sanitize HTML when allowing rich text**

   * If users can submit HTML, sanitize with a whitelist (DOMPurify for JS, Bleach for Python). Remove event handlers (`onclick`) and `javascript:` URLs.

4. **Avoid dangerous DOM APIs**

   * Prefer `textContent` over `innerHTML`. Example:

     ```js
     // Unsafe
     el.innerHTML = userInput;
     // Safe
     el.textContent = userInput;
     ```

5. **Cookie flags**

   * Use `HttpOnly` for cookies (prevents JS access) and `SameSite` for CSRF reduction. Note: `HttpOnly` prevents XSS from reading cookies but not other XSS impacts.

6. **Validate & canonicalize inputs**

   * Validate input formats (whitelists), canonicalize values before use.

---

## 7. Combined practical checklist (to implement)

* CSRF:

  * [ ] Add per-session CSRF tokens to all state-changing forms & APIs (POST/PUT/DELETE).
  * [ ] Validate `Origin`/`Referer` on sensitive endpoints.
  * [ ] Set cookies with `SameSite` attribute.
  * [ ] Avoid state changes via GET.
* XSS:

  * [ ] Ensure template auto-escaping is enabled.
  * [ ] Encode output based on context.
  * [ ] Sanitize inbound HTML with whitelist sanitizer.
  * [ ] Implement CSP with nonce/hash for allowed inline scripts.
  * [ ] Set cookies `HttpOnly`, `Secure`, `SameSite`.
* Testing:

  * [ ] Use Burp/OWASP ZAP to test reflected XSS and CSRF vectors.
  * [ ] Test stored inputs by posting payloads and viewing other user pages.
  * [ ] Run DOM XSS checks (test sinks like `innerHTML`, `eval`).

---

## 8. Example payloads & tests

* **CSRF test**: create a form on attacker site that posts to victim:

  ```html
  <form action="https://bank.com/transfer" method="POST" id="f">
    <input name="to" value="attacker"/>
    <input name="amount" value="1000"/>
  </form>
  <script>document.getElementById('f').submit()</script>
  ```

  If bank accepts this while user is logged-in and no token check, CSRF succeeds.

* **Reflected XSS test**: `?q=<script>alert(1)</script>` and see if result page executes it.

* **Stored XSS test**: submit `<img src=x onerror=alert(1)>` in user content and visit as other user.

---
