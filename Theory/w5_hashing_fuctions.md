## **Hash Function Overview**

A **hash** is a process that converts any input file (like PDF, DOC, image, or text) into a **fixed-size hash value** using a mathematical algorithm.
No matter how large or small the input is, the output (hash) size always remains **fixed**.
This process is **one-way** — meaning you cannot retrieve or reconstruct the original file from its hash value.

### **Purpose of Hashing**

* **Data Comparison:** Used to verify if two files are identical.
* **Data Integrity:** Ensures files are not modified or corrupted.
* **Unauthorized Access Prevention:** Used for secure password storage.
* **Collision Resistance:** Each unique input should produce a different hash output.

---

## **Common Hash Algorithms and Comparison**

| **Algorithm** | **Year** | **Output Size** | **Security Level**     | **Current Status** | **Typical Use**                                 |
| ------------- | -------- | --------------- | ---------------------- | ------------------ | ----------------------------------------------- |
| **MD5**       | 1991     | 128-bit         | Weak (collision-prone) | Broken             | Checksums, non-secure file verification         |
| **SHA-1**     | 1995     | 160-bit         | Weak (collision-prone) | Broken             | Legacy systems                                  |
| **SHA-256**   | 2001     | 256-bit         | Strong                 | Secure             | Passwords, digital certificates, file integrity |

---

### **Explanation:**

* **MD5:** Fast but insecure. It often produces the same hash for different inputs (e.g., “hello” and “Hello”), which makes it **vulnerable to collisions**.
* **SHA-1:** More secure than MD5 but still **broken** — researchers found ways to generate the same hash for different files.
* **SHA-256:** Currently the most **secure and reliable** hashing algorithm. It produces a **256-bit** output and is used for **password protection, digital signatures, and file verification**.

---

### **In Summary**

Hashing ensures **data integrity and authenticity**.
It’s **irreversible**, meaning you can verify data but cannot get the original file back.
Modern systems now rely on **SHA-256** due to its **high collision resistance and strong security**.

