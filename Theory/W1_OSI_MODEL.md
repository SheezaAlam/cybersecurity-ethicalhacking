# OSI Model (Open Systems Interconnection)

The **OSI model** defines how two systems communicate over the internet or a network. It breaks communication into **7 layers**, each with a specific role.

---

## 1. Application Layer

* Provides the user interface to applications.
* Common protocols:

  * **HTTP/HTTPS** – Web browsing
  * **SMTP/IMAP/POP3** – Email
  * **FTP** – File transfer

---

## 2. Presentation Layer

* Formats and translates data for the application layer.
* Functions:

  * Data translation (e.g., ASCII ↔ Unicode)
  * Compression
  * Encryption/Decryption

---

## 3. Session Layer

* Manages sessions (start, maintain, end connections).
* Example: Logging into Facebook — session starts when you log in, ends when you log out.

---

## 4. Transport Layer

* Ensures reliable data delivery between systems.
* Protocols:

  * **TCP** – Connection-oriented, reliable, slower
  * **UDP** – Connectionless, faster, less reliable

---

## 5. Network Layer

* Breaks data into **packets** and determines the best path to the destination.
* Devices: Routers
* Protocols: IP (IPv4, IPv6)

---

## 6. Data Link Layer

* Frames packets and ensures error-free transfer between two nodes on the same network.
* Devices: Switches, NIC (Network Interface Card)
* Protocols: Ethernet, PPP

---

## 7. Physical Layer

* Transmits raw bits (0s and 1s) over physical medium.
* Includes cables, hubs, switches, Wi-Fi signals, etc.

---

### Summary

* **Top 3 layers (Application, Presentation, Session)** → User interaction and data formatting.
* **Middle layer (Transport)** → Reliable or fast delivery (TCP/UDP).
* **Bottom 3 layers (Network, Data Link, Physical)** → Actual data transfer over the network.
