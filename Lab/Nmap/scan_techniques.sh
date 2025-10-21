
### 🔹 **1. -sS (TCP SYN Scan)**

**Meaning:** Sends SYN packets → if SYN/ACK received, port is **open**; sends RST to close it.
**Use:** Stealthy and fast (doesn’t complete handshake).
**Example:**

```bash
nmap -sS 192.168.1.10
```

---

### 🔹 **2. -sT (TCP Connect Scan)**

**Meaning:** Uses normal TCP handshake (SYN → SYN/ACK → ACK).
**Use:** Works without root/admin privileges, but noisy (logged).
**Example:**

```bash
nmap -sT 192.168.1.10
```

---

### 🔹 **3. -sA (ACK Scan)**

**Meaning:** Sends ACK packets to check if port is **filtered** or **unfiltered**.
**Use:** Used to test firewall rules.
**Example:**

```bash
nmap -sA 192.168.1.10
```

---

### 🔹 **4. -sM (Maimon Scan)**

**Meaning:** Sends FIN/ACK packets; older systems may respond differently (can bypass filters).
**Use:** Rarely used, stealthy alternative.
**Example:**

```bash
nmap -sM 192.168.1.10
```

---

### 🔹 **5. -sW (Window Scan)**

**Meaning:** Similar to ACK scan but checks TCP **window size** in RST replies to guess open/closed.
**Use:** For deeper analysis when ACK scan results are unclear.
**Example:**

```bash
nmap -sW 192.168.1.10
```

---
** Tip:**

* Use `-sS` for stealth scanning (most common).
* Use `-sT` if you’re not root.
* Use `-sA` for firewall detection.
* Use `-sM` or `-sW` for deeper network fingerprinting.
