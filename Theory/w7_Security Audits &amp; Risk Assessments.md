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
