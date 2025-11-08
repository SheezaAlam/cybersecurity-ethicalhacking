## Quick facts — OS detection (Nmap)

* **You must have a target address** (IP or hostname).
* **Requires privileges** for some probes — run as `root` / with `sudo` for best results.
* OS detection works by sending TCP/UDP/ICMP probes and matching responses against Nmap’s OS fingerprint database.
* **Accuracy depends on:** open ports, reachable probes (firewalls/WAFs can block probes), and how common the OS fingerprint is.

---

## Useful flags & what they do

* `-O` — **Enable OS detection.**

  ```bash
  sudo nmap -O TARGET_IP
  ```
* `--osscan-guess` — **Allow fuzzy/guessing** when there’s no exact fingerprint match (Nmap will present likely candidates).

  ```bash
  sudo nmap -O --osscan-guess TARGET_IP
  ```

  *This is the “fuzzy” behavior you asked about — it tries to guess the OS when exact match fails.*
* `--osscan-limit` — **Only try OS detection on targets that appear likely to provide reliable results** (saves time and reduces noise).

  ```bash
  sudo nmap --osscan-limit -O TARGET_IP
  ```
* Combine with service/version detection to improve accuracy:

  ```bash
  sudo nmap -sS -sV -O TARGET_IP
  ```

---

## TCP vs UDP & limitations

* OS detection relies mainly on **TCP-based** probes; **UDP** responses are scarcer and less reliable for OS fingerprinting.
* Firewalls or packet filters often make OS detection fail or return misleading guesses.
* If Nmap can’t get good responses, `--osscan-guess` may give **probable** but not certain results — always treat as tentative.

---

## Practical examples

* **Basic OS detection**

  ```bash
  sudo nmap -O 192.0.2.10
  ```
* **OS detection + service/version detection**

  ```bash
  sudo nmap -sS -sV -O 192.0.2.10
  ```
* **Try fuzzy guessing when exact match missing**

  ```bash
  sudo nmap -O --osscan-guess 192.0.2.10
  ```
* **Limit OS scans to likely targets (less noisy)**

  ```bash
  sudo nmap --osscan-limit -O 192.0.2.0/24
  ```

---

## Short tips (one-liners)

* Run as `sudo` for better OS detection.
* If results say “No exact OS matches,” use `--osscan-guess` to get likely candidates.
* Always corroborate Nmap’s OS guess with other evidence (service banners, TTL, open ports).
* Firewalls and NAT make OS detection unreliable — mention uncertainty in reports.

---
