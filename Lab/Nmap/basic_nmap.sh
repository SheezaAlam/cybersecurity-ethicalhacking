# Nmap Quick Commands & Notes

A compact reference of useful Nmap commands and short explanations.

---

## Version & verbosity
- Check Nmap version:
```bash
nmap -V
````

* Verbose output (more information):

```bash
nmap -vv <target>
```

---

## Port states (short explanations)

* **open** — service is actively listening and will accept connections.
* **closed** — the port responded but there is no service accepting connections (like a closed door).
* **filtered** — Nmap cannot determine whether the port is open or closed because packet filtering (firewall) prevents its probes from reaching the port.

---

## Scanning multiple targets

* Scan multiple IPs on the command line:

```bash
nmap <ip1> <ip2> <ip3>
# e.g.
nmap 192.168.1.10 192.168.1.20 192.168.1.30
```

* Scan a whole network using CIDR notation:

```bash
nmap 192.168.56.0/24
```

* Scan a range of IP addresses:

```bash
nmap 192.168.23.1-5
```

* Scan targets listed in a file:

1. Create a file `ip.txt` and list IPs (one per line is typical):

```text
192.168.1.10
192.168.1.20
192.168.1.30
```

2. Run Nmap using that list:

```bash
nmap -F -iL ip.txt
```

(`-iL` tells Nmap to read targets from a file.)

---

## IPv6 scanning

* Check your IPv6 address on the host:

```bash
ip a
# look for "inet6 <address>"
```

* Scan an IPv6 target:

```bash
nmap -6 <ipv6-address>
```

---

## Random targets

* Scan random targets from the Internet (use with caution; only in permitted environments):

```bash
nmap -iR <number_of_targets>
# e.g. nmap -iR 10
```

---

## Display reasons and only open ports

* Show the reason Nmap reports for a port state:

```bash
nmap --reason <target>
```

* Show only open ports in the output:

```bash
nmap --open <target>
```

---

## Useful tips / notes

* When using `-iL` (input list), place one target per line for clarity.
* `-F` limits Nmap to the top 100 most common ports (faster scan).
* Use CIDR notation for whole-network scans (e.g., `192.168.56.0/24`).
* Always run Nmap only against hosts/networks you own or are authorized to test.

