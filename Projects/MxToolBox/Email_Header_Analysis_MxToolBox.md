
# **Project Report: Email Header Analysis using MXToolbox**

## **1. Project Title**

**Managing Email Spoofing through Email Header Analysis using MXToolbox**

---

## **2. Objective**

The main objective of this project is to identify and verify whether a received email is genuine or spoofed. This is achieved by performing an in-depth analysis of the email header using **MXToolbox Email Header Analyzer**. The project demonstrates how header details, authentication checks (SPF, DKIM, and DMARC), and relay information can reveal the true origin and authenticity of an email message.

---

## **3. Tools and Environment**

* **Tool Used:** MXToolbox ([https://mxtoolbox.com/EmailHeaders.aspx](https://mxtoolbox.com/EmailHeaders.aspx))
* **Operating System:** Kali Linux / Windows
* **Browser:** Google Chrome or Firefox
* **Email Source:** Gmail message header (from ACCA Careers)

---

## **4. Theory / Background**

Email spoofing is a technique used by attackers to send emails that appear to come from legitimate sources. To counter this, modern email systems use authentication protocols that verify the sender’s identity.
The three most important mechanisms are:

* **SPF (Sender Policy Framework):**
  Checks if the sending mail server is authorized to send emails for the domain.
  If SPF passes, it means the sender’s IP address is valid for that domain.

* **DKIM (DomainKeys Identified Mail):**
  Uses a digital signature to verify that the email content was not altered during transit.

* **DMARC (Domain-based Message Authentication, Reporting & Conformance):**
  Combines SPF and DKIM to determine whether to accept, quarantine, or reject an email.

Analyzing these checks, along with relay and routing data in the header, helps determine whether an email is legitimate or spoofed.

---

## **5. Procedure**

### **Step 1: Obtaining the Email Header**

1. Open the suspicious or target email in Gmail.
2. Click on **“Show Original”** to view the raw email header.
3. Copy the complete header text.

### **Step 2: Using MXToolbox**

1. Go to **[https://mxtoolbox.com/EmailHeaders.aspx](https://mxtoolbox.com/EmailHeaders.aspx)**.
2. Paste the copied header into the text box.
3. Click **“Analyze Header.”**

MXToolbox processes the header and displays a structured analysis, including SPF, DKIM, DMARC results, relay servers, delays, and authentication details.

---

## **6. Results and Analysis**

The analyzed email header belongs to a confirmation message from **ACCA Careers** with the subject **“Application submitted confirmation (ACCA Careers)”**.
MXToolbox provided the following insights:

### **Authentication Checks**

| Mechanism               | Result  | Explanation                                                           |
| ----------------------- | ------- | --------------------------------------------------------------------- |
| **SPF Alignment**       | OK      | The sending domain matches correctly.                                 |
| **SPF Authentication**  | Problem | Possible lookup issue or intermediate relay.                          |
| **DKIM Alignment**      | OK      | The digital signature aligns properly.                                |
| **DKIM Authentication** | Problem | May have failed at relay level but verified later.                    |
| **DMARC Compliance**    | Problem | Partial failure due to SPF/DKIM issues, but not necessarily spoofing. |

### **Relay Path**

The email traveled from **mta126.madgexjb.com (IP 52.209.63.219)** to **mx.google.com**, which is Google’s mail server.
The IP address belongs to **Amazon AWS**, indicating that the sender uses Amazon Route 53 infrastructure for email delivery.
There was only a one-second delivery delay, showing a direct and legitimate mail path.

### **SPF and DKIM Verification**

* SPF record for `accaglobal.com` allows IP `52.209.63.219`.
  This confirms the IP is authorized to send emails for this domain.
* DKIM uses **RSA-SHA256**, which is a strong cryptographic signature.
  Gmail’s authentication results confirm `dkim=pass`, meaning the content was not altered after sending.

### **Authentication Results (Google)**

From Gmail’s own verification:

```
Authentication-Results: mx.google.com;
dkim=pass;
spf=pass;
dmarc=pass
```

All three checks **passed successfully**, confirming the authenticity of the email.

### **Return-Path and From Address**

The **Return-Path** and **From** address both show:

```
accacareers@accaglobal.com
```

Matching addresses indicate that the sender’s identity was not forged — a strong sign of legitimacy.

---

## **7. Conclusion**

The email from **ACCA Careers** successfully passes SPF, DKIM, and DMARC verification at the recipient’s end (Google).
The message originated from an authorized IP (Amazon AWS) and followed a legitimate mail relay path.
Despite partial issues shown by MXToolbox, the final authentication results confirm that the email is genuine and not spoofed.

This project demonstrates how **email header analysis** helps verify authenticity, trace the delivery path, and detect signs of spoofing or phishing. By checking SPF, DKIM, and DMARC, users can identify whether an email truly originates from the claimed sender or from a malicious impersonator.

---

## **8. Learning Outcome**

Through this project, the following concepts were understood:

* How to extract and interpret email headers.
* The importance of SPF, DKIM, and DMARC in preventing spoofed emails.
* How to use MXToolbox to analyze headers and authenticate sender information.
* How to identify legitimate versus suspicious emails based on header data.

