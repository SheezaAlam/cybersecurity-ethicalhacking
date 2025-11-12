From
What it is: The email address that appears as the sender in your inbox.


Example: From: Google Account Team <security@google.com>


Key point: This is what the user sees, but it can be spoofed (faked) by attackers.


 1. Return-Path Domain
What it is:
 The Return-Path is the address where email “bounces” (failed delivery notices) are sent.


How we identify it:
 We check the Return-Path: header and compare its domain (e.g., @gmail.com) with the domain in the From: header.


Why it matters:
 If they are different, it may mean the email was sent using another mail server — which can be a spoofing attempt or third-party sender.


 Example: Return-Path: user@abc.com, From: user@gmail.com → suspicious mismatch.


 Received
What it is: A record of the servers that handled the email before it reached you.


Example:


Received: from mail.example.com (mail.example.com [192.168.1.1])
        by mx.google.com with ESMTPS id abc123;
        Mon, 10 Nov 2025 11:11:22 -0800 (PST)





 2. SPF (Sender Policy Framework)
What it is:
 SPF is like a permission list for which mail servers can send emails for a domain.


How we check:
SPF Result Explained
spf=pass (google.com: domain of bounce+411b43.2ba27-shizaalam50=gmail.com@mg.ziprecruiter.com designates 161.38.201.104 as permitted sender) smtp.mailfrom="bounce+411b43.2ba27-shizaalam50=gmail.com@mg.ziprecruiter.com";

spf=pass ✅


This means the sending server is allowed to send emails for that domain according to SPF.


Gmail checked and said: “Yes, the IP is authorized.”


domain of ...@mg.ziprecruiter.com


The domain part here is mg.ziprecruiter.com.


This is the domain whose SPF record is being checked.


designates 161.38.201.104 as permitted sender


This is the IP address of the server that actually sent the email.


SPF record of mg.ziprecruiter.com allows this IP → pass.


smtp.mailfrom=...


The envelope sender address that SMTP used during delivery.


SPF checks this address’s domain to see if the sending server is authorized.
Why it matters:
 If SPF fails, it means the email was sent from a server not authorized by the sender’s domain — a common sign of spoofing.



 3. DKIM (DomainKeys Identified Mail)
What it is:
 DKIM adds a digital signature to an email, proving it hasn’t been changed during delivery.


How we check:
 The header includes “DKIM=pass” if the signature is valid.


Why it matters:
 If DKIM fails, it means someone might have modified the email’s content or it’s not really from that sender.



 4. DMARC (Domain-based Message Authentication, Reporting & Conformance)
What it is:
 DMARC combines SPF and DKIM to tell email providers what to do if a message looks fake (reject, quarantine, or accept).


How we check:
 We see if “DMARC=pass” or “fail” appears in the header.


Why it matters:
 If DMARC fails, it usually confirms that authentication failed and the domain doesn’t trust this email.



📨 5. Subject Keywords
What it is:
 Certain words in the subject line (like “urgent”, “verify”, “click”, “account”, “password”) are phishing triggers.


How we check:
 The code scans the subject for these suspicious words.


Why it matters:
 Attackers often use urgent or fear-based words to trick users into clicking links.



 6. Attachments
What it is:
 Files attached to emails (like .exe, .bat, .zip) can carry malware or viruses.


How we check:
 The analyzer looks for file names and flags dangerous extensions.


Why it matters:
 Suspicious or executable attachments are often used to infect systems.



 7. Duplicate Headers
What it is:
 When the same header (like “From” or “Subject”) appears more than once in the raw email.


How we check:
 The code counts how many times key headers appear.


Why it matters:
 Duplicates can happen when someone manually edits or spoofs the header to confuse filters or hide real info.




 8. Header Anomalies
What it is:
 Unusual or inconsistent header structures — like missing fields, duplicated lines, or weird formatting.


How we check:
 Our analyzer detects patterns that don’t match normal email formatting.


Why it matters:
 Anomalies suggest the email might have been tampered with or created outside a legitimate mail system.



