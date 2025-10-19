## Basic flags & meanings

* `nmap -Pn TARGET`
  `-Pn` here means Nmap **doesn't check whether the host is up or not** (skip host discovery).
  Useful to **bypass simple firewall/ICMP blocks** and force port scanning even if host discovery fails.

* `nmap -sP TARGET`
  (Old syntax — now `-sn`)
  **Only checks which hosts are up without scanning for open ports.**
  Use to discover connected devices on a network (no port enumeration).

* `nmap -PS TARGET`
  `-PS` = **TCP SYN ping** (probe with TCP SYN packets).
  SYN = sync request to start a TCP connection.

  * `SYN` -> request to connect.
  * `SYN,ACK` -> reply from host (port likely open).
  * `ACK` -> ack to establish connection.

* `nmap -PA TARGET`
  `-PA` sends TCP ACK probes (used for host discovery).
  (Can be useful to detect hosts behind some filters.)

* `nmap -PU TARGET`
  `-PU` tells Nmap to send **UDP packets** as probes to see if a host is up.
  *Probe = test message.*

* `nmap -PY TARGET`
  `-PY` used for host discovery for **SCTP** (Stream Control Transmission Protocol).
  (SCTP is used in telecom / signaling sometimes; it works like TCP SYN but uses SCTP INIT/COOKIE/INIT-ACK.)
  If no ports provided, it may target common ports (e.g., port 80) depending on options used.

* `nmap -PE TARGET`
  `-PE` uses **ICMP Echo** (classic ping) for host discovery.
  ICMP = Internet Control Message Protocol (used for network diagnostics).

  * Echo requests help identify if a host is up.
  * Many firewalls block ICMP, so this is not always reliable.

* `nmap -PP TARGET`
  `-PP` uses **ICMP Timestamp** request for discovery (timestamp probe).

* `nmap -PR TARGET`
  `-PR` uses **ARP** for discovery (works only on same Ethernet/LAN).
  ARP cannot be blocked by an IP-based firewall, so it reliably finds hosts on the same LAN.

* `nmap -PO <protocols> TARGET`
  `-PO` tells Nmap to send packets with particular **IP protocol numbers** (the IP protocol field) to detect hosts that respond to those protocols.
  Example protocols: ICMP (1), IGMP (2), TCP (6), UDP (17). You supply numbers or names.

---

## TCP behaviour notes (your original points, clarified)

* **TCP SYN**: initial sync request to open a TCP connection.
* **SYN-ACK**: server replies to SYN to acknowledge and allow connection (indicates port open).
* **ACK**: acknowledgment to complete the three-way handshake.
* **TCP ACK probes**: used to infer state; if there is **no reply** it can indicate the host/port is **filtered** (firewalled).
* If a connection is lost, peers may respond with **RST** (reset).

---

## DNS-related flags (short list you gave)

* `-n`  Disable all DNS resolution (faster; IPs only).
* `-R`  Force reverse DNS lookups (PTR records).
* `--dns-servers`  Use specific DNS servers.
* `--system-dns`  Use the system resolver instead of Nmap’s built-in DNS engine.

---

## Small usage reminders (kept from your content)

* `probe` means **test messages** sent to check host responsiveness.
* Use ARP (`-PR`) only when target is on the **same LAN** (works reliably there).
* ICMP (`-PE`) can be blocked by firewalls and therefore can **fail to detect** hosts behind filters.
* `-Pn` forces scans even if host discovery would otherwise mark host down — useful to **bypass simple host-down checks** done by firewalls/IDS.

