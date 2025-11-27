# **Data at Rest and Data in Transit**

## **1. Data in Transit**

**Definition:**
Data in transit refers to data that is actively moving from one location to another — for example, data sent between a client and a server, or between two networked systems.

### **Security Measures**

* **Encryption:** Always encrypt data during transmission using strong algorithms such as **AES** or **RSA**.

  * Use **public key** encryption for sending data securely and **private key** for decryption.
* **Secure Communication Protocols:**

  * Ensure use of safe and encrypted ports like **HTTPS**, **SSH**, and **SFTP**.
* **Multi-Factor Authentication (MFA):**

  * Add extra verification layers to prevent unauthorized access during communication.
* **Secure VPN:**

  * Use a **Virtual Private Network (VPN)** to protect traffic over public or untrusted networks.
* **Certificate Validation:**

  * Check for **valid digital certificates (SSL/TLS)** to confirm secure communication channels.
* **Hashing:**

  * Apply **hashing algorithms (SHA-256, SHA-512)** to maintain integrity and detect tampering.

### **Common Threats**

* **Man-in-the-Middle (MITM) Attacks:** Intercepting communication between sender and receiver.
* **Packet Sniffing:** Monitoring or capturing network packets to extract data.
* **Data Tampering:** Alteration of data during transmission.
* **Session Hijacking:** Stealing active user sessions to gain unauthorized access.

---

## **2. Data at Rest**

**Definition:**
Data at rest refers to data stored on physical or digital media — such as hard drives, SSDs, databases, or cloud storage — when it is not actively being transmitted.

### **Security Measures**

* **Encryption:**

  * Encrypt stored data using AES or full-disk encryption tools.
* **Access Control:**

  * Define **role-based privileges** to limit access according to user roles and responsibilities.
* **Physical Security:**

  * Protect servers, drives, and devices from theft or unauthorized physical access.
* **Regular Backups:**

  * Backup critical data frequently to avoid data loss due to corruption or attacks.
* **Data Masking:**

  * Conceal sensitive data elements in databases or applications to reduce exposure.
* **Safety Guards:**

  * Implement antivirus, intrusion detection, and secure firewalls for endpoint protection.

### **Common Threats**

* **Physical Theft or Damage:** Unauthorized access or destruction of storage devices.
* **Unencrypted Storage:** Leaving sensitive data unprotected on disks or drives.
* **Unauthorized Access:** Attackers exploiting weak permissions or insider misuse.

---

## **Summary**

| **Aspect**          | **Data in Transit**                        | **Data at Rest**                    |
| ------------------- | ------------------------------------------ | ----------------------------------- |
| **State**           | Moving over a network                      | Stored on devices/servers           |
| **Main Protection** | Encryption, Secure Protocols, Certificates | Encryption, Access Control, Backups |
| **Threats**         | MITM, Sniffing, Tampering, Session Hijack  | Physical Theft, Unauthorized Access |
| **Tools/Methods**   | HTTPS, SSH, VPN, TLS, MFA                  | AES Encryption, RBAC, Data Masking  |

---

**Conclusion:**
Both *data at rest* and *data in transit* require continuous protection through encryption, access control, and monitoring. Ensuring security at both stages helps maintain **confidentiality, integrity, and availability (CIA)** of information in all environments.
