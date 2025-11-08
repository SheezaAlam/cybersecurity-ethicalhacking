# **WEB APPLICATION ARCHITECTURE & SECURITY PRINCIPLES**

### **Introduction to Web Applications**

A **web application** is a program accessed through a browser that interacts with a **server** (e.g., Gmail, Facebook, Amazon).
It allows users to **input data**, which is **processed by the server** and returns results.

| **Website**                    | **Web Application**     |
| ------------------------------ | ----------------------- |
| Static information (read-only) | Interactive and dynamic |
| Minimal or no database         | Heavy database usage    |
| Example: Wikipedia             | Example: Gmail, Amazon  |

**Analogy:**

* Website → Digital poster (view only)
* Web App → Digital shop (browse, add to cart, pay, interact)

---

### **Web Application Architecture**

**Client–Server Model**

* **Client (User)** → Sends request (e.g., open inbox).
* **Server** → Processes request and sends a response.
* *Analogy:* Client = Customer, Server = Kitchen.

**Client Side (Front-End):**

* Runs in browser (HTML, CSS, JS).
* Handles interface and user interactions.
* Example: Login form.

**Server Side (Back-End):**

* Runs on server (handles logic, authentication, database).
* Example: Verifies username/password before login.

**Sensitive data** (like passwords) should always be stored and processed **on the server side**.

---

### **Core Security Principles**

**1. Principle of Least Privilege**
Give users only the permissions they need.
→ Example: A student should not access a teacher’s gradebook.

**2. Defense in Depth**
Use multiple layers of defense — firewalls, authentication, encryption, logging, IDS.
→ *Analogy:* A bank has guards, cameras, and alarms — not just one lock.

**3. Never Trust User Input**
Always validate and sanitize data before processing.

* **Validation:** Ensure input meets expected format.

  * Name → only letters
  * Age → only numbers
  * Email → valid format
* **Sanitization:** Remove dangerous input (e.g., quotes `'` in SQL).

  * Prevents **SQL Injection** (e.g., `' OR '1'='1`).

---

### **Conclusion**

* Web apps use **Client–Server architecture**.
* **Front-end** handles interface; **Back-end** handles logic and security.
* Apply key **security principles**:

  1. Least Privilege
  2. Defense in Depth
  3. Input Validation & Sanitization

**Example:**
For an online shopping app — use HTTPS, server-side validation, encrypted passwords, firewalls, and least privilege for users and admins.

