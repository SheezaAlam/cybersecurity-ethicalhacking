# DNS & DHCP 

## Domain Name System (DNS)

**What is DNS?**
DNS translates human-friendly names (like `google.com`) into IP addresses that computers use to route traffic. It works like a phone book: you look up a name and get a numeric address.

### How DNS resolution works (simplified)

1. **Client query / Cache check**

   * The resolver (usually your OS or ISP resolver) first checks local cache. If the name is cached, it returns the IP and stops.

2. **Root server**

   * If not cached, the resolver asks a root DNS server which points to the appropriate top-level domain (TLD) servers (for example, `.com`, `.pk`, `.edu`).

3. **TLD server**

   * The TLD server responds with the authoritative name servers for the requested domain.

4. **Authoritative DNS server**

   * The resolver queries the authoritative server for the domain, which returns the final IP address. The resolver then returns the IP to the client and caches the answer for future queries.

### Common DNS record types (short)

* `A` — IPv4 address record.
* `AAAA` — IPv6 address record.
* `CNAME` — Canonical name (alias).
* `MX` — Mail exchange server.
* `NS` — Name server records.
* `TXT` — Arbitrary text (often used for SPF, DKIM).

### DNS attacks (overview — defensive focus)

* **DNS spoofing / cache poisoning** — attacker injects false DNS responses so clients resolve a domain to the wrong IP.
* **DNS hijacking** — attacker changes DNS settings (e.g., at router or registrar) to redirect traffic.
* **DNS tunneling** — abuse of DNS to exfiltrate data or establish covert channels.

**Basic mitigations**

* Use **DNSSEC** where available to validate DNS records.
* Use trusted resolvers (local enterprise resolvers, Cloudflare, Google) and enable DNS over TLS/HTTPS for privacy.
* Keep DNS server software up to date and restrict who can update authoritative records.
* Monitor DNS logs for unexpected changes and TTL anomalies.

---

## Dynamic Host Configuration Protocol (DHCP)

**What is DHCP?**
DHCP automatically assigns IP configuration (IP address, gateway, DNS servers, subnet mask) to devices on a network so administrators don’t have to configure addresses manually.

### DHCP (DORA) process — 4 steps

1. **Discover** — Client broadcasts a DHCPDISCOVER to find DHCP servers.
2. **Offer** — DHCP server replies with a DHCPOFFER containing an available IP and lease info.
3. **Request** — Client broadcasts DHCPREQUEST to accept the offer.
4. **Acknowledge** — DHCP server sends DHCPACK confirming the lease and configuration.

### Static vs Dynamic addressing

* **Static:** An address manually assigned to a device (rare for clients; used for servers/printers).
* **Dynamic (DHCP):** Devices are assigned addresses automatically from a pool for a lease period.

### DHCP attacks and defenses

* **Rogue DHCP server / DHCP spoofing** — an attacker offers malicious network settings to clients.
  **Mitigation:** Use DHCP snooping on switches, port security, and authorize DHCP servers only on trusted ports.
* **Lease exhaustion** — attacker requests many leases to deplete the DHCP pool.
  **Mitigation:** Rate limit DHCP requests and use monitoring/alerts.

---

## Viewing IP & network info (commands)

**Windows**

* Show TCP/IP configuration:

```powershell
ipconfig /all
```

**Linux (common)**

* Show IP addresses and interfaces:

```bash
ip a
# or (legacy)
ifconfig
```

* Check routing table / default gateway:

```bash
ip route
```

* Ping an address to test reachability:

```bash
ping -c 4 8.8.8.8
```

---

## Summary (one-liner)

* **DNS** = name → IP translation (root → TLD → authoritative).
* **DHCP** = automatic IP configuration (DORA: Discover, Offer, Request, Acknowledge).
* Always follow defensive best practices: patch resolvers, use DNSSEC/secure DNS, and harden DHCP with network switch features.

