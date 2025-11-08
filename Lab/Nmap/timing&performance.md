# Nmap — Timing Options Report

**Purpose:** quick reference / report showing Nmap timing templates (`-T0` … `-T5`), why/when to use each, and concrete command examples you can copy and run in lab environments.
**Safety reminder:** Always have written permission before scanning networks you do not own. Use lab VMs or RFC5737 test ranges for demos.

---

## Summary table

| Template | Name       |         Speed | Detection risk (IDS/IPS) | Typical use                                                                        |
| -------: | ---------- | ------------: | -----------------------: | ---------------------------------------------------------------------------------- |
|    `-T0` | paranoid   |     very slow |             **very low** | stealthy, avoid simple IDS/IPS signatures (authorized tests only)                  |
|    `-T1` | sneaky     |          slow |                      low | quiet scanning when you need to reduce noise                                       |
|    `-T2` | polite     | moderate-slow |                    lower | gentle on networks; reduces load                                                   |
|    `-T3` | normal     |       default |               **medium** | default, balanced for most use-cases                                               |
|    `-T4` | aggressive |          fast |                     high | lab/local networks where speed matters                                             |
|    `-T5` | insane     |     very fast |            **very high** | only on very trusted local networks — **do not use** on office/production networks |

---

## Why slow down (`-T0` / `-T1` / `-T2`)?

If Nmap sends many probes quickly, IDS/IPS systems often detect the burst (e.g., “> X SYNs in Y seconds”) and raise alerts or block traffic. Slowing the scan spreads probes out over time so simple rate-based detectors are less likely to trigger.
**Tradeoff:** slower scans take much longer.

---

## Practical command examples

> Replace `TARGET` with an IP or hostname (use lab IPs like `192.0.2.10` for repo examples).

### Very slow / stealth (paranoid)

```bash
sudo nmap -sS -T0 -p 1-1024 TARGET
```

Use when you must be very quiet (authorized only). Takes a long time.

### Slow / sneaky

```bash
sudo nmap -sS -T1 -p 1-1024 TARGET
```

### Polite (reduce network load)

```bash
sudo nmap -sS -T2 -p 1-1024 TARGET
```

### Default / Normal

```bash
sudo nmap -sS -T3 -p 1-1024 TARGET
```

`-T3` is the balanced default. Detection risk = medium.

### Fast / Aggressive (lab use)

```bash
sudo nmap -sS -T4 -p 1-65535 TARGET
```

Good for your own VM/lab. **Do not** use this on office networks without permission.

### Very fast / Insane (trusted local only)

```bash
sudo nmap -sS -T5 -p 1-65535 TARGET
```

Extremely noisy. **Never** use `-T5` on office/production networks.

---

## Fine-grained alternatives (when you want control instead of whole template)

* Add fixed delay between probes:

```bash
sudo nmap -sS --scan-delay 500ms -p 1-1024 TARGET
```

* Limit packets per second:

```bash
sudo nmap -sS --max-rate 10 -p 1-1024 TARGET
```

These let you be polite/quiet while keeping more predictable timing than `-T0`.

---

## Short recommendations

* Default to `-T3` for general testing in labs.
* Use `-T4` for faster scans on your own VMs.
* Use `-T0`/`-T1` only when you need stealth **and** you are authorized.
* **Never** use `-T5` on office or production networks.
* If you need to be quiet in a corporate engagement, coordinate with operations/security — they may whitelist your scanning IP or give a scan window.

---

## Example report snippet for repo (sanitized)

```
# Nmap Timing Options — Example
Date: <SANITIZED_DATE>

Target: TARGET_IP

Commands executed (lab demo):
- sudo nmap -sS -T3 -p 1-1024 TARGET_IP
- sudo nmap -sS -T0 -p 1-1024 TARGET_IP   # very slow, stealth demo
- sudo nmap -sS --scan-delay 500ms -p 1-1024 TARGET_IP

Notes:
- T0/T1: use for stealth; long runtime.
- T3: default balanced.
- T4/T5: fast; use only in trusted labs.
```
