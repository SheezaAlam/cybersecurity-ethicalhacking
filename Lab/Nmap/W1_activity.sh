# Day 01 — Network Scanning & Initial Access Attempt (Lab)

**Date:** 2025-09-25
**Environment:** Local lab (Kali Linux VM as attacker, Windows VM as target)
**Authorization:** Explicit permission obtained for this lab exercise. All published artifacts will be sanitized.

## Objective

Practice end-to-end reconnaissance and initial access techniques in a controlled lab: identify a Windows host on the subnet, verify reachability, enumerate services, and attempt an initial access PoC. No destructive actions were taken.

## Environment & Preparation

* Network configured as NAT in the hypervisor so VMs share a private lab subnet.
* VM snapshots were taken prior to intrusive testing (rollback points available).
* Tests performed on lab VMs only; no external or production systems were targeted.

## Actions (high level)

1. On the Windows target: opened Command Prompt and ran `ipconfig` to obtain the host IP address.
2. On the Kali attacker VM: verified reachability by `ping`ing the Windows IP and observed no packet loss.
3. Performed service discovery using Nmap to enumerate open ports and services on the target.
4. Launched the Metasploit Framework console to run an auxiliary SMB module and test a connection (message box activity used as a benign connectivity test).
5. Attempted a known SMB exploit (MS17-010) as a proof-of-concept to evaluate whether the service was exploitable in this environment.
6. The exploit attempt failed; subsequent investigation indicated the target’s firewall blocked the exploitation attempt.

## Observations & Result

* The Windows host responded to ICMP (ping) with 0% packet loss under NAT.
* Nmap revealed open SMB-related service(s) (sanitized in published outputs).
* The SMB auxiliary/module successfully demonstrated connection behavior (benign test).
* The exploit module did not succeed because the target firewall prevented the exploit from completing.

## Safety, Ethics & Documentation

* All actions were performed with prior authorization and within the lab scope.
* VM snapshots were taken before attempts that could change the target state.
* No credentials were used or exfiltrated.
* Raw outputs and screenshots will be sanitized (IP addresses, MACs, hostnames) before publishing.
* Exploit command syntax and step-by-step exploitations are **not** published in this repository to avoid unsafe or actionable disclosure.

## Files to be Uploaded (sanitized)

* `outputs/nmap_scan_<redacted>.nmap` — sanitized Nmap results.
* `outputs/ip_a_redacted.txt` — sanitized attacker interface info.
* `screenshots/2025-09-24_ping_redacted.png` — ping verification.
* `screenshots/2025-09-24_nmap_redacted.png` — Nmap output (redacted).
* `screenshots/2025-09-24_msf_connection_redacted.png` — Metasploit auxiliary connection demonstration (sensitive fields redacted).

> Note: PCAPs and raw exploit logs will be kept offline and provided to instructors only via a private channel if requested.

## Next steps

* Investigate firewall rules and confirm which rule blocked the exploit attempt (in lab only).
* Repeat controlled persistence/privilege escalation practice only on isolated snapshots.
* Produce a sanitized follow-up report that includes sanitized console outputs and annotated screenshots.

