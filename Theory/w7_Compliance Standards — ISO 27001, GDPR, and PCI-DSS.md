# Security Audits & Risk Assessments – Complete Notes

## **Introduction to Security Audit**

* A **security audit** is a systematic, independent evaluation of an organization's information systems, security controls, and practices.
* It checks whether security policies and procedures are properly **designed, implemented, and effective**.
* **Example:** A bank undergoes an audit to verify compliance with **ISO-27001**.

### **Purposes of Security Audits**

* Measure compliance with internal policies or external standards (ISO 27001, HIPAA, NIST).
* Identify security gaps before attackers discover them.
* Ensure continuous improvement of the organization’s security posture.

---

## **Types of Security Audits**

### **1. Internal Audit**

* Conducted by **in-house** teams.
* Focuses on internal controls and adherence to company policies.
* **Example:** IT team checking if employees follow the password policy.

### **2. External Audit**

* Performed by an **independent third-party**.
* Used for certifications (e.g., PCI-DSS).
* **Example:** PCI-DSS auditor verifies protection of credit card data.

### **3. Compliance Audit**

* Ensures organization meets required regulations/standards.
* **Example:** Checking encryption requirements for GDPR.

### **4. Technical Security Audit**

* Focuses on **technical controls**, configurations, vulnerabilities.
* **Example:** Reviewing firewall rules and patch management.

---

## **Security Audit Process**

| Phase                  | Description                                       | Example Activity                            |
| ---------------------- | ------------------------------------------------- | ------------------------------------------- |
| **1. Planning**        | Define objectives, scope, and criteria.           | Identify systems and standards (ISO 27001). |
| **2. Data Collection** | Gather info about policies, logs, configurations. | Interview staff, review logs.               |
| **3. Evaluation**      | Compare with standards and best practices.        | Check password policy compliance.           |
| **4. Reporting**       | Document findings and recommendations.            | Audit report with severity levels.          |
| **5. Follow-up**       | Ensure corrective actions have been completed.    | Verify patches are applied.                 |

---

## **Common Audit Tools & Techniques**

* **Nmap** – Port & vulnerability scanning.
* **Wireshark** – Network packet analysis.
* **SIEM tools** – Log collection & correlation.

  * *Log correlation:* Analyzing connected events across logs to detect patterns or threats.
* **Access control reviews** – Checking user privileges.

**Example:**

* An organization may fail an audit this year even after passing last year because **controls must be continuously maintained**, systems and threats evolve.

---

## **Importance of Security Audits**

* Builds trust with customers, partners, and regulators.
* Ensures legal & regulatory compliance.
* Identifies outdated or weak controls.
* Supports incident response readiness.
* Ensures accountability and continuous improvement.

---

# **Risk Assessment**

A **risk assessment** identifies, analyzes, and evaluates potential risks to information assets.

It answers:

1. **What are the critical assets?**
2. **What threats & vulnerabilities could affect them?**
3. **What is the likelihood and impact of an incident?**

### **Goal:** Support informed decision-making on risk mitigation or acceptance.

---

## **Key Concepts**

| Term              | Definition                                        | Example                |
| ----------------- | ------------------------------------------------- | ---------------------- |
| **Asset**         | Anything valuable to the organization.            | Customer database.     |
| **Threat**        | Potential cause of an unwanted incident.          | Malware, hacker.       |
| **Vulnerability** | Weakness that could be exploited.                 | Unpatched software.    |
| **Impact**        | Damage caused if risk occurs.                     | Data breach, downtime. |
| **Likelihood**    | Probability of threat exploiting a vulnerability. | High/Medium/Low.       |

### **Risk Formula:**

**Risk = Likelihood × Impact**

---

## **Steps in Risk Assessment**

| Step                                      | Description                             | Example                                                |
| ----------------------------------------- | --------------------------------------- | ------------------------------------------------------ |
| **1. Identify Assets**                    | List critical systems and data.         | Customer DB, servers.                                  |
| **2. Identify Threats & Vulnerabilities** | Determine what can go wrong.            | Threat: ransomware; Vulnerability: outdated antivirus. |
| **3. Evaluate Risk**                      | Determine likelihood & impact.          | High likelihood × high impact = Critical risk.         |
| **4. Prioritize Risks**                   | Rank risks to address major ones first. | Fix critical risks immediately.                        |
| **5. Mitigation/Treatment**               | Decide how to treat risks.              | Apply patches.                                         |
| **6. Document & Review**                  | Maintain records & reassess regularly.  | Annual assessment.                                     |

---

## **Risk Treatment Options**

| Option       | Description                  | Example                    |
| ------------ | ---------------------------- | -------------------------- |
| **Avoid**    | Remove the risky activity.   | Stop using unsupported OS. |
| **Mitigate** | Reduce likelihood or impact. | Apply patches, enable MFA. |
| **Transfer** | Shift risk to another party. | Cyber insurance.           |
| **Accept**   | Acknowledge and monitor.     | Accept small downtime.     |

**Example:** If weak passwords risk exists → **Mitigate** (implement strong password policy).

---

## **Linking Audits & Risk Assessments**

* **Risk Assessments identify** what controls are needed.
* **Security Audits verify** whether those controls are effective.

### **Analogy:**

* **Risk Assessment = Diagnosis** (finding issues)
* **Security Audit = Check-up** (confirming treatment works)

---

## **Key Takeaways**

* Security audits evaluate existing controls.
* Risk assessments identify what controls should exist.
* Both are continuous processes.
* Together, they enhance compliance, reduce uncertainty, and improve resilience.

---

# Discussion Questions

1. Why do organizations need both audits and risk assessments?
2. What happens if audit findings are ignored?
3. Why must risk assessments be repeated regularly?

---

# Short Quiz

**1. Security audits primarily check:**

* a) How tasks are performed
* **b) Whether controls are effective and compliant** ✔
* c) Server configuration details

**2. Risk assessments primarily answer:**

* **a) What could go wrong and how serious it is** ✔
* b) How to configure firewalls
* c) What hardware to buy

**3. Which of the following is a risk treatment option?**

* a) Ignore the risk
* **b) Mitigate the risk** ✔
* c) Delay indefinitely

## Compliance Standards — ISO 27001, GDPR, and PCI-DSS

### **Introduction to Compliance in Cybersecurity**

* **Compliance** means following laws, regulations, and standards.
* Ensures systems, processes, and data protection meet required benchmarks.
* **Why it matters?**

  * Protects sensitive data.
  * Reduces breach risk.
  * Helps avoid legal penalties.
  * Builds trust and supports business operations.

---

## **Major Cybersecurity Compliance Standards**

1. **ISO 27001** – International standard for Information Security Management.
2. **GDPR** – EU regulation focused on personal data protection.
3. **PCI-DSS** – Standard for protecting payment card data.

---

# **ISO 27001: Information Security Standard**

### **What is ISO 27001?**

* Published by ISO & IEC.
* Framework for **ISMS (Information Security Management System)**.
* Ensures confidentiality, integrity, and availability (CIA).

### **Purpose**

* Identify and manage security risks.
* Implement and improve security controls.

### **Key Components**

1. **ISMS** – Systematic security management.
2. **Risk Assessment** – Identify & evaluate risks.
3. **Security Controls** – Annex A contains 93 controls.
4. **Continuous Improvement (PDCA)**.

### **PDCA Cycle**

* **Plan** – Define scope, identify risks.
* **Do** – Implement controls.
* **Check** – Monitor & audit.
* **Act** – Correct & improve.

### **Annex A Controls**

* Organizational
* People
* Physical
* Technological

### **Benefits**

* Builds trust.
* Reduces breach probability.
* Supports compliance.

---

# **GDPR: General Data Protection Regulation**

### **What is GDPR?**

* EU regulation (2018).
* Applies globally if handling EU citizens' data.
* Focused on privacy rights & data protection.

### **Key Principles**

* Lawfulness, fairness, transparency.
* Purpose limitation.
* Data minimization.
* Accuracy.
* Storage limitation.
* Integrity & confidentiality.
* Accountability.

### **GDPR User Rights**

| Right               | Description                        |
| ------------------- | ---------------------------------- |
| Access              | User gets a copy of their data.    |
| Rectify             | Correct incorrect data.            |
| Erasure             | Delete personal data.              |
| Portability         | Provide data in readable format.   |
| Object              | User can stop certain processing.  |
| Restrict processing | Temporarily stop use of data.      |
| Breach notification | Must inform users within 72 hours. |

### **GDPR Roles**

* **Data Controller** – Decides purpose & method of processing.
* **Data Processor** – Processes data on controller’s instructions.
* **DPO** – Oversees GDPR compliance.

### **Penalties**

* Up to **€20 million or 4% of global revenue**.

### **Best Practices**

* Get explicit consent.
* Maintain processing records.
* Encrypt/anonymize data.
* Conduct **DPIA** when needed.

### **Steps of a DPIA**

1. Identify processing activity.
2. Assess necessity.
3. Identify risks.
4. Mitigation measures.
5. Document & review.

---

# **PCI-DSS: Payment Card Industry Data Security Standard**

### **What is PCI-DSS?**

* Created by PCI Security Standards Council.
* Mandatory for all businesses handling card data.

### **Objective**

* Reduce credit card fraud.
* Secure cardholder data.

### **Core Requirements**

1. Secure network (firewalls, no default passwords).
2. Protect cardholder data (encryption).
3. Vulnerability management (antivirus, patching).
4. Access control (need-to-know basis).
5. Monitoring & testing (logging, pentesting).
6. Maintain security policies.

### **Compliance Levels**

**Level 1** – >6 million transactions (annual audit by QSA, ROC, quarterly scans).

**Level 2** – 1–6 million transactions (SAQ, quarterly scans, possible audits).

### **Benefits**

* Prevents fraud.
* Builds customer confidence.
* Avoids penalties.

### **Consequences of Non-Compliance**

* Fines: $5,000–$100,000/month.
* Loss of ability to process cards.
* Reputation damage.

---

# **Summary Table**

| Standard  | Focus                | Applies To                        | Objective              |
| --------- | -------------------- | --------------------------------- | ---------------------- |
| ISO 27001 | Information Security | All organizations                 | Build & maintain ISMS  |
| GDPR      | Data Privacy         | Anyone handling EU data           | Protect personal data  |
| PCI-DSS   | Card Security        | Businesses handling card payments | Secure cardholder data |

---

# **Common Goals Across All Standards**

* Protect sensitive data.
* Reduce breach risks.
* Ensure accountability & governance.
* Increase customer trust.
