
# Before starting Nmap

> Quick reference — what you must know and set before running Nmap scans.

---

## Required inputs / variables
- **ip** — the IP address of the target machine (this **must** be provided).  
  - If scanning a large network (office/home) provide a **subnet** (for example `192.168.1.0/24`).
- **service type** — type of service to target (e.g., `ftp`, `http`, `dns`).  
  - Set the port(s) accordingly for that service.
- **scan type** — choose the scan type (for example: `syn` or `ack`).
- **scan timing** — set timing templates (for example: `slow`, `fast`).
- **output type** — decide how to save results and in which format.

> Note: you must always supply the `ip` parameter. Other options can be set automatically or by default if not provided.

---

## Nmap scanning — host discovery

### If you want to discover hosts first:
- **Root host (common discovery probes):**
  - ICMP Echo Request
  - ICMP Timestamp Request
  - TCP SYN
  - TCP ACK

- **Local host (common probes):**
  - TCP SYN
  - TCP ACK

### Skip host discovery
If you do not want Nmap to attempt host discovery, use:
```bash
nmap -Pn <ip-address-or-subnet>
````

---

## How scanning works (TCP connection basics)

### Normal three-way handshake (connection established)

1. Host A sends a `SYN` packet to Host B (to open a connection on B's port).
2. Host B responds with `SYN,ACK` (accepting the connection).
3. Host A replies with `ACK` — the connection is established.

### Scenario 2 — connection refused / no connection

1. Host A sends a `SYN` to Host B's port.
2. Host B responds with `SYN` and `RST` (or RST alone) back to A.

   * This indicates the port will not accept the connection — no connection is made.

---

## Short checklist before running a scan

1. Provide `ip` or subnet.
2. Choose `service type` and set the corresponding port(s).
3. Select `scan type` (e.g., `syn`, `ack`).
4. Select `scan timing` (slow or fast).
5. Decide output format and location.
6. (Optional) If you do not want discovery, use `-Pn` with the target IP.

