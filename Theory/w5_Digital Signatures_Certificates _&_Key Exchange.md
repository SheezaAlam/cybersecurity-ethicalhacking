# Cryptographic Concepts: Digital Signatures, Digital Certificates, and Key Exchange

## Overview

This document explains three foundational cryptographic concepts used to secure communication and verify identity: digital signatures, digital certificates, and key exchange. The explanations are concise and focused on practical understanding.

---

## Digital Signatures

A digital signature provides two main guarantees about a message:

1. **Authenticity** — the message was created by the claimed sender.  
2. **Integrity** — the message has not been altered since it was signed.

### How it works (high level)
- The sender computes a cryptographic hash of the message.
- The sender encrypts that hash with their **private key**; this encrypted hash is the digital signature.
- The sender sends the message along with the signature to the recipient.
- The recipient computes the hash of the received message and uses the sender’s **public key** to decrypt the signature to obtain the signed hash.
- If the decrypted hash equals the computed hash, the signature is valid: the message is authentic and unmodified.

### Key points
- The private key is kept secret by the signer. The public key is distributed widely.
- A valid signature means the message was signed by the holder of the corresponding private key and was not tampered with.
- Common signature algorithms: RSA (with PKCS#1 v1.5 or PSS), ECDSA (Elliptic Curve Digital Signature Algorithm), EdDSA.

---

## Digital Certificates

A digital certificate binds a public key to an identity (for example, a person, an organization, or a hostname).

### Components of a certificate
- Subject (identity information)
- Public key (the key belonging to the subject)
- Issuer (Certificate Authority, CA)
- Validity period (not before / not after)
- Digital signature (the CA’s signature over the certificate fields)

### How certificates are used
- A certificate proves that a CA vouches for the binding between a public key and an identity.
- Browsers and clients trust a set of root CAs; they verify the CA signature on server certificates during TLS handshakes.
- If a certificate is valid and signed by a trusted CA, the client treats the identity as authenticated.

### Key points
- Certificates enable others to trust public keys without meeting the owner in person.
- Revocation mechanisms (CRL, OCSP) allow invalidating certificates before their expiry when compromise occurs.

---

## Key Exchange

Key exchange is a method for two parties to establish a shared symmetric key over an insecure network. That shared key is then used for efficient symmetric encryption of the session.

### Common key exchange approaches
- **Diffie-Hellman (DH)**: both sides compute a shared secret using each other’s public parameters; the secret is never transmitted.
- **Elliptic Curve Diffie-Hellman (ECDH)**: the elliptic curve variant of Diffie-Hellman, providing the same security with smaller keys.
- **Key agreement in TLS**: uses (EC)DHE for forward secrecy; ephemeral keys are negotiated per session.


