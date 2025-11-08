# **Project Report: File Encryption and Integrity Checker using Python**

## **1. Project Title**

**File Encryption and Integrity Management using Python and SQLite**

---

## **2. Objective**

The objective of this project is to design and implement a Python-based tool that ensures the **confidentiality and integrity** of files.
The tool performs **encryption**, **decryption**, and **file integrity verification** using cryptographic techniques and stores integrity information in an **SQLite database** for later verification.

---

## **3. Tools and Technologies**

* **Programming Language:** Python 3
* **Libraries Used:**

  * `hashlib` (for hashing files)
  * `sqlite3` (for database storage)
  * `argparse` (for command-line interface)
  * `pycryptodome` (for AES encryption/decryption)
* **Database:** SQLite
* **Operating System:** Kali Linux
* **File Path:** `/home/shiza/Desktop/filetool.py`

---

## **4. Theory / Concept**

This project combines **cryptography** and **file integrity management** to secure sensitive data.

### **Encryption and Decryption**

* **Algorithm Used:** AES-256 (Advanced Encryption Standard) in GCM mode.
* The program derives a secure 256-bit encryption key from a password using **PBKDF2** (Password-Based Key Derivation Function 2).
* The file is encrypted using AES, and a **tag** is generated to ensure data authenticity.
* Decryption verifies the tag before restoring the original file; if verification fails, it means the password is incorrect or the file was tampered with.

### **Integrity Verification**

* Each file’s **SHA-256 hash** is computed and stored in a local SQLite database (`file_integrity.db`).
* When checked later, the tool recomputes the hash and compares it to the stored one:

  * If the hashes match → the file is **unchanged**.
  * If they differ → the file is **modified or corrupted**.

---

## **5. Implementation Steps**

### **Step 1: Database Initialization**

A database named `file_integrity.db` is created on the desktop to store filenames and their hashes.

```python
conn = sqlite3.connect(DB_PATH)
c.execute('CREATE TABLE IF NOT EXISTS files (filename TEXT PRIMARY KEY, hash TEXT NOT NULL)')
```

### **Step 2: File Hashing**

Uses SHA-256 algorithm to generate a unique digital fingerprint for each file:

```python
hashlib.sha256(file_contents).hexdigest()
```

### **Step 3: File Encryption**

* The file is encrypted with AES in GCM mode using a password.
* Salt and nonce are used to enhance security.
* Output file is stored as `<filename>.enc`.

### **Step 4: File Decryption**

* The encrypted file is decrypted using the same password.
* If authentication fails, the program displays:

  ```
  Decryption failed! The password may be incorrect or the file was tampered with.
  ```

### **Step 5: Integrity Storage and Checking**

* The hash is stored in the SQLite database.
* During integrity checks, the stored hash is compared with the current hash.
* If they differ, the system reports tampering.

### **Step 6: Demo Function**

A built-in demo runs automatically through all stages:

1. Creates a file named `secret.txt`
2. Encrypts it into `secret.txt.enc`
3. Stores the file’s hash in the database
4. Verifies the file integrity
5. Decrypts it back to `secret_decrypted.txt`

---

## **6. Execution Commands**

To run the project, open the terminal and execute:

### **Demo Mode**

```bash
cd /home/shiza/Desktop
python3 filetool.py demo
```

### **Manual Commands**

**Encrypt a file**

```bash
python3 filetool.py encrypt secret.txt -p "MyPass123" -o secret.enc
```

**Decrypt a file**

```bash
python3 filetool.py decrypt secret.enc -p "MyPass123" -o secret_decrypted.txt
```

**Store file hash for integrity**

```bash
python3 filetool.py integrity-check secret.txt --store
```

**Verify file integrity**

```bash
python3 filetool.py integrity-check secret.txt
```

---

## **7. Results**

| Function                       | Output                                                         |
| ------------------------------ | -------------------------------------------------------------- |
| **Encryption**                 | Displays: “File encrypted successfully → secret.enc”           |
| **Decryption**                 | Displays: “File decrypted successfully → secret_decrypted.txt” |
| **Integrity Check (Match)**    | “File integrity OK — file has not been tampered with.”         |
| **Integrity Check (Mismatch)** | “ALERT: file has been modified or tampered!”                   |

Database (`file_integrity.db`) contains stored hashes for verification.

---

## **8. Error Handling**

The tool provides clear and user-friendly error messages:

* Incorrect password → “Decryption failed! The password may be incorrect or the file was tampered with.”
* Missing file or database → Informative warning to reinitialize or store the hash again.

---

## **9. Conclusion**

This project successfully implements a **File Encryption and Integrity Checker** that combines **cryptography** and **data verification**.
It helps ensure:

* **Confidentiality:** through AES encryption
* **Integrity:** through SHA-256 hash verification
* **Accountability:** using a stored database of file hashes

Such a tool is practical for cybersecurity students and professionals to protect sensitive files and detect any unauthorized modification.

---

## **10. Learning Outcomes**

After completing this project, the following concepts were learned:

1. Implementing AES encryption and decryption in Python.
2. Using SHA-256 for digital fingerprinting of files.
3. Managing file integrity using SQLite databases.
4. Building command-line tools with user-friendly messages and arguments.
5. Detecting and preventing file tampering effectively.

