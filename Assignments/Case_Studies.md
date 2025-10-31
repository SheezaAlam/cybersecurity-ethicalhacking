# Cybersecurity Case Studies

## WannaCry Ransomware (2017)

### 1. Introduction
In May 2017, organizations across the world were attacked by WannaCry ransomware.  
Hospitals in the UK, companies like FedEx, Nissan, Renault, and even government offices were affected.  
Over 200,000 computers in more than 150 countries were infected due to an unpatched Windows vulnerability.

### 2. Attack Overview
WannaCry was a ransomware worm that encrypted files and demanded Bitcoin payments to unlock them.  
It spread using the EternalBlue exploit, originally developed by the NSA.  
This exploit was leaked online by a group called Shadow Brokers.

### 3. Vulnerability Exploited
The attack exploited outdated, unpatched versions of Microsoft Windows.  
Organizations running legacy systems like Windows XP were especially vulnerable.  
Those that failed to apply Microsoft’s critical update were easily compromised.

### 4. Attack Execution
1. Shadow Brokers leaked the EternalBlue exploit.  
2. WannaCry used this exploit to infect systems.  
3. The worm spread automatically from one machine to another without user interaction.

### 5. Impact Assessment
- **Confidentiality:** No private data was stolen, only encrypted for ransom.  
- **Integrity:** Files were not altered but were locked and unusable.  
- **Availability:** Services were disrupted; hospitals canceled appointments, and companies halted operations.

### 6. Mitigation & Response
A security researcher, Marcus Hutchins, accidentally activated a kill switch by registering a domain used in the malware.  
Microsoft released emergency patches, even for unsupported systems like Windows XP.  
This quick action helped stop further spread of the attack.

### 7. Lessons Learned
- Always update systems and apply patches immediately.  
- Maintain regular backups to avoid data loss from ransomware.  
- Avoid using outdated operating systems.  
- Increase cybersecurity awareness and rapid response capabilities.

### References
- BBC News (2017). *WannaCry cyber-attack: Who was affected?*  
- The Guardian (2017). *NHS and global companies hit by WannaCry ransomware.*  
- Symantec Report (2017). *Technical analysis of WannaCry ransomware.*

---

## Target POS Breach (2013)

### 1. Introduction
Target Corporation, a major U.S. retail chain, suffered a large-scale data breach in late 2013.  
The attack occurred between November and December 2013 and was disclosed publicly on December 19, 2013.  
It became one of the most significant retail data breaches in history.

### 2. Attack Overview
- **Type of Attack:** Supply-chain attack using POS malware.  
- **Initial Access Vector:** Attackers compromised a third-party HVAC vendor (Fazio Mechanical Services) via phishing, then used stolen credentials to access Target’s internal network.

### 3. Vulnerability Exploited
- Weak third-party security controls.  
- Poor network segmentation between vendor and payment systems.  
- Ignored alerts from intrusion detection systems.

### 4. Attack Execution
1. The vendor was compromised through phishing.  
2. Stolen credentials were used to access Target’s network.  
3. Attackers moved laterally to the POS systems.  
4. BlackPOS (Kaptoxa) malware captured payment card data.  
5. Data was sent to attacker-controlled servers in the U.S. and Russia.

### 5. Impact Assessment
- **Confidentiality:** 40 million card numbers and 70 million customer records were exposed.  
- **Integrity:** No signs of data tampering.  
- **Availability:** Business operations continued with minimal disruption.

### 6. Mitigation & Response
Target removed the malware, notified customers, and offered free credit monitoring.  
The company enhanced network segmentation and adopted stronger security measures, including EMV chip-and-PIN technology.  
The breach cost Target over $162 million, including an $18.5 million settlement with U.S. states.

### 7. Lessons Learned
1. Continuous monitoring and quick incident response are essential.  
2. Enforce strict security for third-party vendors.  
3. Use network segmentation, MFA, encryption, and regular security audits to prevent breaches.

### References
- U.S. Senate Committee on Commerce, Science, and Transportation (2014). *A “Kill Chain” Analysis of the 2013 Target Data Breach.*  
- Verizon (2014). *Data Breach Investigations Report (DBIR).*  
- Krebs, B. (2014). *Target Hackers Broke in via HVAC Company.* KrebsOnSecurity.
