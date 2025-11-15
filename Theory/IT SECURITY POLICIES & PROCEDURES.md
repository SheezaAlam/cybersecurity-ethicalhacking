
# **IT SECURITY POLICIES & PROCEDURES**

**1️⃣ Governance, Risk & Compliance (GRC)**

* **Governance:** Rules & processes to align IT with business goals. *(Examples: COBIT, ITIL)*
* **Risk Management:** Identify → Assess → Mitigate risks. *(Example: Risk levels → Countermeasures)*
* **Compliance:** Meet internal & external rules (GDPR, HIPAA, ISO 27001).

**Why Policies & Procedures Matter:**

* Translate governance into action
* Standardize behavior
* Ensure audit & regulatory compliance
* Prevent breaches (e.g., strong password policy)

---

**2️⃣ Security Policies vs Procedures**

| Aspect  | Policy                                | Procedure                             |
| ------- | ------------------------------------- | ------------------------------------- |
| Purpose | What & why                            | How                                   |
| Level   | High-level                            | Step-by-step                          |
| Example | Laptops must use full-disk encryption | Install encryption → Configure → Test |

**Characteristics of Good Policy:** Clear, enforceable, aligned with business, management-approved, regularly updated

**Common Policies:**

* Acceptable Use Policy (AUP) → e.g., No unauthorized downloads
* Password Policy → e.g., 12+ characters, symbols
* Data Classification → Public, Internal, Confidential, Restricted
* Access Control → Role-based
* Incident Response → Report breaches within 1 hour
* Network Security → Only approved ports open
* Email & Communication → No forwarding company data

**Policy Lifecycle:** Draft → Review → Distribute → Implement → Monitor → Update

---

**3️⃣ Procedures**

* Step-by-step actions to enforce policies
* Minimize errors, enable auditing, guide new staff

**Example:**

* Policy: “Complex passwords required”
* Procedure: Step 1: 12 chars, Step 2: Upper + lower + symbol, Step 3: Change every 90 days

**Hierarchy:** Policy → Standard → Procedure

---

**4️⃣ Importance & Challenges**

* Provides legal foundation
* Defines roles & responsibilities
* Supports compliance
* Promotes awareness

**Challenges:** Lack of support, poor communication, outdated or too strict policies

**Best Practices:** Involve stakeholders, align with business & law, keep simple, train, audit, central repository

---

# **Security Audits & Risk Assessments**

**1️⃣ Security Audit**

* Evaluates effectiveness of security controls
* **Types:** Internal, External, Compliance, Technical
* **Process:** Planning → Data Collection → Evaluation → Reporting → Follow-up
* **Tools:** Nmap, Wireshark, SIEM, Access Reviews

**2️⃣ Risk Assessment**

* Identifies assets, threats, vulnerabilities, likelihood, impact
* **Formula:** Risk = Likelihood × Impact
* **Treatment Options:** Avoid, Mitigate, Transfer, Accept
* **Purpose:** Prioritize security investments, improve incident response, support decisions

**Audit ↔ Risk Assessment:**

* Risk Assessment → Identify what needs protection
* Audit → Check if controls work

---

# **Compliance Standards (ISO 27001, GDPR, PCI-DSS)**

**1️⃣ ISO 27001**

* Framework for ISMS (Information Security Management System)
* **PDCA Cycle:** Plan → Do → Check → Act
* **Controls (Annex A):** Organizational, People, Physical, Technological
* **Goal:** Continuous improvement, CIA (Confidentiality, Integrity, Availability)

**2️⃣ GDPR** (EU Data Protection)

* Protects personal data of EU citizens
* **Principles:** Lawfulness, Purpose Limitation, Data Minimization, Accuracy, Storage Limitation, Integrity & Confidentiality, Accountability
* **Roles:** Data Controller (decides), Data Processor (executes), DPO (oversight)
* **User Rights:** Access, Rectify, Erasure, Portability, Object, Restrict, Breach Notification
* **Penalties:** Up to €20 million or 4% global revenue

**3️⃣ PCI-DSS** (Payment Card Security)

* Secures credit card data
* **Core Principles:** Secure network, Protect data, Vulnerability management, Access control, Monitor/test networks, Security policy
* **Compliance Levels:**

  * Level 1 → >6M transactions → On-site audit + ROC
  * Level 2 → 1–6M transactions → SAQ + quarterly scans
* **Penalties:** Fines, loss of merchant privileges, reputational damage

** Common Goals Across All Standards:**

* Protect sensitive data
* Accountability & governance
* Reduce breach risk
* Build customer trust

---

# **Visual Recap Guide (Flow)**

```
GOVERNANCE → POLICIES → STANDARDS → PROCEDURES
        ↓
    RISK ASSESSMENT → AUDIT
        ↓
    COMPLIANCE (ISO 27001, GDPR, PCI-DSS)
```

* **Policy:** WHAT & WHY
* **Procedure:** HOW
* **Audit:** CHECK if policies/procedures work
* **Risk Assessment:** IDENTIFY what could go wrong
* **Compliance:** FOLLOW legal & industry standards

---

