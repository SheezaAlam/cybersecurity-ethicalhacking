# Nmap scripts — quick notes & commands

* `-sC`

  * Runs Nmap’s **default script set**.
  * Used to fetch common info (OS/service probes, common vuln checks, basic enumeration).

* Run all SMB-related scripts:

```bash
nmap --script=smb* TARGET
```

* Run vulnerability-focused scripts:

```bash
nmap --script=vuln TARGET
```

* (`--script=vuln` runs scripts that look for known vulnerabilities)

* Brute-force SSH (weak-password check):

```bash
nmap --script=ssh-brute IP_ADDRESS
```

* Typical workflow: service discovery then targeted scripts

```bash
sudo nmap -sS -sV TARGET
# (find open ports and service versions)
```

Then check which service is open (example: `telnet` on port 23). Find relevant scripts and run them against that port.

* List available scripts and filter by protocol/service (example: HTTP scripts):

```bash
ls /usr/share/nmap/scripts | grep -i http
```

(This shows the scripts related to HTTP.)

* Get info / run a specific script against a port (example: run `http-script-name` on port 80):

```bash
nmap --script http-script-name -p 80 TARGET
```

---

## Extra tiny tips (safe & practical)

* Use `-sS -sV` first to see what services are running, then pick the matching script(s).
* Script names often start with the service name (e.g., `smb-*`, `http-*`, `ssh-*`).
* `--script=vuln` is good for a quick vulnerability sweep, but always verify results manually.
* Be authorized to scan targets; do not run brute-force (`ssh-brute`) or intrusive scripts against production/public systems without permission.

