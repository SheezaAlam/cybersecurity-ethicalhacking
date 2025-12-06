# Footprinting, Scanning and Enumeration Techniques

## **Introduction**

* Ethical hackers begin by gathering information about a target — this is called **reconnaissance**.
* Goal: collect as much information as possible before exploiting vulnerabilities.
* Three main stages:

  1. **Footprinting (Reconnaissance)** – Learning about the target.
  2. **Scanning** – Finding active systems and services.
  3. **Enumeration** – Extracting detailed information from discovered services.

---

# **1. Footprinting (Reconnaissance)**

Footprinting = collecting maximum information about a target organization, website, or network.
It is the **first step** of ethical hacking.

## Types of Footprinting

### **A. Passive Footprinting**

Collecting information **without touching the target system**.

**Sources:**

* Search engines (Google, Bing)
* Domain registration lookup (WHOIS)
* Company's official website
* Social media pages (Facebook, LinkedIn, Twitter)
* Employee profiles on LinkedIn
* Public code repositories (GitHub)

**Why important?**

* Helps create a picture of the organization, its structure, employees, and technologies.

**Example:**
You find that *example.com* uses subdomains:

* vpn.example.com
* portal.example.com

This helps you plan the attack surface.

---

### **B. Active Footprinting**

Direct interaction with the target to collect technical details.

**Examples:**

* Ping to check if the system is online
* Identifying open ports by sending connection requests

These interactions help identify live systems and services.

---

# **2. Scanning**

After footprinting, the next step is scanning — identifying active devices, open ports, and services.

It answers:

* Which computers are online?
* Which ports are open?
* What services/software run on each port?

## **Common Tool: Nmap (Network Mapper)**

Used for:

* Host discovery
* Port scanning
* Service version detection

## **Types of Scanning**

### **A. Host Discovery**

Finds which systems are active (ping sweeps).

### **B. Port Scanning**

Identifies open and closed ports.

### **C. Service Scanning**

Detects which service/software is running on each open port.

**Examples:**

* Port 80 → Web server (HTTP)
* Port 22 → SSH login available

**Why scanning matters:**

* Helps map the network
* Reveals exposed services vulnerable to attacks

---

# **3. Enumeration**

Enumeration = extracting detailed information from services found during scanning.

Enumeration can reveal:

* Shared folders/files
* OS details (e.g., Windows Server 2019)
* Software versions
* Usernames
* Network shares and permissions

## **Common Enumeration Techniques**

### **A. SMB Enumeration (Windows Networks)**

Can reveal:

* User accounts
* Machine names
* Shared folders and printers

### **B. SNMP Enumeration**

If default community strings like "public" are used, attackers can get:

* Device uptime
* Network interfaces
* Device configurations

### **C. SMTP Enumeration (Email Servers)**

Helps find **valid email addresses**.

### **1. VRFY Command**

Checks if a specific user exists.

* **Valid User Response:** Code 250 → user exists
* **Invalid User Response:** Code 550 → user unknown

Attackers test common usernames like:

* admin
* support
* j.doe

### **2. EXPN Command**

Reveals all members of a mailing list.

**Example:**
`EXPN sales` → returns full list of employee emails in the sales department.

This helps attackers prepare phishing attacks.

---

# **Summary**

* **Footprinting**: Collecting information (passive + active)
* **Scanning**: Finding online hosts, open ports, and services
* **Enumeration**: Collecting detailed system and user information

---

# **Activity Questions**

**Q1: Footprinting means:**
A) Exploiting vulnerabilities
B) Gathering information
C) Blocking attacks
D) Deleting logs

**Q2: Which tool is widely used for scanning?**
A) Wireshark
B) Nmap
C) Photoshop
D) Excel

**Q3: VRFY command is used in:**
A) HTTP
B) SMTP
C) FTP
D) DNS

**Q4: Passive footprinting includes:**
A) Port scanning
B) Social media research
C) Password cracking
D) Exploit development

**Q5: Enumeration helps find:**
A) System themes
B) Usernames and shares
C) Background images
D) Weather data
