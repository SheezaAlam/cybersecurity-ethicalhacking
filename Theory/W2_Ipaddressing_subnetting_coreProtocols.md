# IP Addressing and Subnetting

**IP addresses** are unique identifiers assigned to computers or devices connected to a network. They work like digital addresses, allowing systems to locate and communicate with each other.

---

## Types of IP Addresses

1. **IPv4**

   * Uses a **32-bit address**.
   * Provides about **2³² unique addresses (~4.3 billion)**.
   * Written in **decimal format**, divided into 4 octets (e.g., `192.168.1.1`).

   Example:

   * Binary: `10000001`
   * Decimal: `128 + 1 = 129`

2. **IPv6**

   * Uses a **128-bit address**.
   * Provides about **2¹²⁸ unique addresses** (virtually unlimited).
   * Written in **hexadecimal format** (e.g., `2001:0db8::1`).

---

## Subnetting

* **Subnetting** is dividing a large network into smaller networks.
* It improves **efficiency, security, and management**.

### IP Classes

* **Class A**: `0 – 127` → Default subnet mask `/8`
* **Class B**: `128 – 191` → Default subnet mask `/16`
* **Class C**: `192 – 223` → Default subnet mask `/24`

---

## Core Protocols

1. **TCP (Transmission Control Protocol)**

   * **Connection-oriented** (connection established first).
   * More **reliable** (guarantees delivery, error-checking).
   * Used in applications like web browsing, email, file transfer.

2. **UDP (User Datagram Protocol)**

   * **Connectionless** (packets sent without prior connection).
   * **Faster**, but less reliable (packets may be lost).
   * Used in video streaming, gaming, voice calls.

---

### Summary

* **IPv4** is limited, **IPv6** solves address shortage.
* **Subnetting** breaks networks into manageable pieces.
* **TCP = reliability**, **UDP = speed**.
