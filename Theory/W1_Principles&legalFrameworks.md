# Principles of Ethical Hacking

Ethical hacking is the legal practice of testing a system to evaluate its security.
It identifies vulnerabilities so the system can be strengthened, and helps organizations meet compliance and regulatory requirements. Ethical hacking is performed **with permission** from the system owner.

---

## Purpose and Benefits

* Strengthen systems by identifying and remediating weaknesses.
* Assist organizations in meeting compliance and regulatory obligations.
* Provide an authorized, controlled way to discover security gaps before malicious actors exploit them.

---

## Types of Hackers

* **White hat** — Hacks systems with permission to find vulnerabilities and report them to the owner; actions are legal and ethical.
* **Black hat** — Hacks without permission to steal, corrupt, or exploit data; these actions are illegal.
* **Grey hat** — Operates between authorized and unauthorized behavior. May discover vulnerabilities without permission and report them (sometimes charging a fee); actions can be legally risky.

---

## Typical Phases of an Assessment

1. **Reconnaissance** — Passive information gathering about the target.
2. **Information gathering** — Collecting details that help identify possible attack vectors.
3. **Scanning** — Active scanning (for example, using Nmap) to discover open ports and potential vulnerabilities.
4. **Gaining access** — Exploiting vulnerabilities (for example, SQL injection) to obtain a foothold.
5. **Maintaining access** — Establishing persistence, such as installing backdoors, to allow return access (only in controlled, authorized tests).

---

## Core Principles

* **Confidentiality** — Protect sensitive information discovered during testing.
* **Integrity** — Avoid unauthorized modification of data; preserve evidence integrity.
* **Authorized access** — Only test systems where explicit permission has been granted.
* **Non-disclosure** — Do not disclose sensitive findings except to authorized parties.
* **Reporting** — Provide clear, reproducible findings and remediation guidance to the owner.

---

## Rules of Engagement (RoE) — Key Elements

* Define **which systems** will be tested.
* Specify **which methods and tools** are allowed or disallowed.
* Set the **timeframe** and any safe-hours or blackout periods for testing.

A signed RoE should exist before any active testing begins.

---

## Relevant International Frameworks

* **GDPR** — Requires organizations to protect personal data; data breaches generally must be reported within 72 hours.
* **CFAA (Computer Fraud and Abuse Act)** — Addresses unauthorized access; ethical hackers must obtain consent to avoid legal liability.

---

