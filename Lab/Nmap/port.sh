# Nmap Quick Reference (structured)

This page summarizes common Nmap options for quick scanning and examples.

---

## Fast scan (top common ports)
- Nmap by default knows many commonly used ports (~1000).  
- `-F` trims the scan to the *top 100* commonly used ports (fast scan).

**Example**
```bash
nmap -F <target>
# e.g.
nmap -F 192.168.56.1
````

---

## Scan specific ports (`-p`)

* Use `-p` to specify one or more ports. You can list single ports, comma-separated ports, and ranges.

**Examples**

```bash
# Single port
nmap -p 80 192.168.52.130

# Multiple ports and a range
nmap -p 80,139,190-1000 192.168.52.130
```

---

## Specify ports by service name

* `-p` accepts **service names** (when known) instead of numeric ports.
* To get service/version details, combine with `-sV` (service/version detection).

**Example**

```bash
# Using service names with -p
nmap -p msrpc,http,apex-mesh 192.168.52.130

# With service/version detection for more details
nmap -sV -p msrpc,http,apex-mesh 192.168.52.130
```

**Sample output (columns show PORT / STATE / SERVICE)**

```
PORT      STATE   SERVICE
80/tcp    closed  http
135/tcp   closed  msrpc
912/tcp   closed  apex-mesh
8008/tcp  closed  http
```

---

## Scan all TCP ports (wildcard)

* Use `-p "*" ` to scan **all** TCP ports (1–65535).

**Example**

```bash
nmap -p "*" <target>
```

---

## Scan top N ports

* `--top-ports <N>` scans the top N most common ports.

**Example**

```bash
nmap --top-ports 10 192.168.52.130
```

---

## Sequential ports discovery (no randomization)

* `-r` prevents randomization of port order; Nmap will scan ports sequentially in numeric order.
* Combine with `-v` for verbose output.

**Example**

```bash
nmap -v -r <target>
# -r  : do not randomize ports
# -v  : verbose
```

