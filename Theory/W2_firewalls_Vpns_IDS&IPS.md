#  Intrusion Detection & Prevention System (IDS / IPS)

##  **IDS (Intrusion Detection System)**

An **IDS** monitors network or host activity for **suspicious or malicious behavior** and **alerts** the administrator — but it **does not block** the traffic.

### **Types of IDS**

1. **Host-Based IDS (HIDS)**

   * Installed on individual systems.
   * Monitors activities on that host (e.g., file changes, login attempts).
   * **Example:** If an employee tries to access admin files without permission → alert is generated.

2. **Network-Based IDS (NIDS)**

   * Monitors network traffic between devices.
   * Detects unusual communication or attacks across the network.
   * **Example:** Detects suspicious data packets between computers in an office.

---

### **Detection Techniques**

1. **Signature-Based Detection**

   * Uses a database of **known attack patterns (signatures)**.
   * If current traffic matches a signature → alert.
   * If not → ignored.
   * **Example:** Detects a known malware or exploit pattern.

2. **Anomaly-Based Detection**

   * Learns normal behavior and flags anything unusual.
   * Detects **zero-day** or new attacks but can raise false alarms.
   * **Example:**

     * A designer tries to access admin settings → flagged as abnormal.
     * A user fails login 50 times in 2 minutes → possible brute-force attack.

---

##  **IPS (Intrusion Prevention System)**

An **IPS** not only detects threats like IDS but also **blocks or stops** them in real time.
It prevents malicious traffic from reaching the target.

* **Example 1:** If a hacker tries an SQL injection → IPS drops the packets and blocks the connection.
* **Example 2:** If a user tries 1000 wrong passwords → IPS expires the session and blocks access temporarily.

🔸 **IDPS (Intrusion Detection and Prevention System)** = IDS + IPS
It both **detects** and **prevents** suspicious actions.



---

##  FIREWALL 

A **firewall** protects your computer or network by **checking all data that enters or leaves**.
It **blocks bad traffic** and **allows safe traffic** — just like a security guard at a gate.

---

##  **Firewall Policy Approaches**

### 1. **Blacklist (Default-Allow)**

* All traffic is allowed **except** the ones on the block list.
* **Example:**
  Allow all websites except `malicious.com`.
*  Pros: Easy and flexible.
*  Cons: New threats can pass through if not blacklisted yet.

---

### 2. **Whitelist (Default-Deny)**

* All traffic is **blocked** unless it’s on the allowed list.
* **Example:**
  Only allow websites like `google.com`, `youtube.com`, block everything else.
*  Pros: Very secure.
*  Cons: You must allow every safe website manually.

---

##  **Types of Firewalls**

### 🔹 1. **Based on System**

**a) Network Firewall**

* Works between the internet and internal network.
* Filters traffic using **IP addresses** and **protocols**.
* **Example:**
  Block all traffic from IP `192.168.5.10`.

**b) Personal Firewall**

* Installed on a **single computer**.
* Controls which programs can use the internet.
* **Example:**
  If an unknown app tries to connect online, firewall asks: “Allow or Block?”

---

### 🔹 2. **Based on Protocol Level**

**a) Transport-Level Firewall**

* Filters based on **port numbers**.
* **Example:**

  * Block port `23` (Telnet → unsafe)
  * Allow port `443` (HTTPS → safe)
* Also protects against **SYN flood attacks** (DoS).

**b) Application-Level Firewall**

* Works at app layer, filters **websites and services**.
* **Example:**
  Allow only `office.com` and block social media sites.
* Keeps a **log** of all allowed and blocked connections.

---

###  3. **Based on State Knowledge**

**a) Stateless Firewall**

* Checks each packet **individually**.
* Doesn’t remember past connections.
* **Example:**
  A guard checks your ID every time you enter — forgets you after you leave.
*  Can’t detect ongoing or fake connections (weak).

**b) Stateful Firewall**

* Remembers active connections (keeps a **state table**).
* Only allows packets that belong to valid sessions.
* **Example:**
  A guard keeps a logbook of who entered and who is still inside.
  Fake visitors (not in the logbook) get blocked.
*  Safer and smarter.

