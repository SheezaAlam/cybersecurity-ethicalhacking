# Cyber Attack Vectors & Basic Defenses

This repository collects concise, practical notes on common **cyber attack vectors** and basic defensive concepts. It is intended as a study and reference resource for beginners learning how attackers gain unauthorized access and how organizations can reduce risk.

---

## What is a cyber attack vector?

A **cyber attack vector** is a path or method used by an attacker to gain unauthorized access to a system, network, or data. Understanding attack vectors helps defenders prioritize protections and harden systems.

### Main purposes of studying attack vectors

* Identify likely points of entry for attackers.
* Understand how attackers operate so defenders can design mitigations.
* Strengthen systems and reduce the risk of compromise.

---

## Common attack vectors

### Social engineering

Manipulating people to reveal information or perform actions that compromise security (for example, phishing emails, deceptive phone calls, or impersonation).
**Defenses:** user training, phishing simulations, email filtering, verification processes.

### Unpatched software

Software that has not received security updates (patches).
Analogy: like a broken lock that an attacker can exploit. Unpatched systems are vulnerable to known exploits, malware installation, and data theft.
**Defenses:** timely patch management, asset inventory, prioritizing internet-facing systems.

### Weak credentials

Simple, reused, or guessable passwords and PINs that are easy to brute force or guess.
**Defenses:** enforce strong passwords, use passphrases, enable account lockout, and require multi-factor authentication.

### Malicious or negligent insiders

Employees or contractors who intentionally or accidentally expose company data or systems. Even unintentional mistakes (clicking malicious links, misconfiguring settings) can cause breaches.
**Defenses:** least-privilege access, offboarding procedures (revoke former employees’ access), monitoring, security awareness training.

---

## Why this matters

Organizations must combine technical controls, process controls, and user education. Attack vectors are often combined: for example, social engineering to obtain credentials, then unpatched software to escalate access.

---

## Authentication levels (simple model)

1. **Something you know** — Passwords, PINs.
2. **Something you have** — Smart cards, OTP tokens, phone-based authentication.
3. **Something you are** — Biometrics (fingerprint, face, iris).

Stronger authentication uses multiple levels (multi-factor authentication) to reduce the risk from stolen or guessed credentials.

