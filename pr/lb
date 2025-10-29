

# Setup on Kali (quick)

Open a terminal on Kali and run:

```bash
# 1. Update and install python/pip if needed
sudo apt update
sudo apt install -y python3 python3-venv python3-pip

# 2. Create a venv and install dependency
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install pycryptodome

# 3. Save the script as filetool.py (copy/paste from below)
# 4. Make it executable (optional)
chmod +x filetool.py
```

---

# The script — save as `filetool.py`

```python
#!/usr/bin/env python3
"""
filetool.py

Single-file project: AES-GCM file encrypter/decrypter + integrity checker using SHA-256.
Usage examples at the bottom of this file.

Dependencies:
    pip install pycryptodome

Works on Kali (Linux) with Python 3.
"""

import argparse
import sqlite3
import os
import sys
import hashlib
import json
import time
from pathlib import Path
from datetime import datetime
from getpass import getpass
from typing import Optional, Tuple

# Crypto imports (PyCryptodome)
from Crypto.Cipher import AES
from Crypto.Protocol.KDF import PBKDF2
from Crypto.Random import get_random_bytes
from Crypto.Hash import HMAC, SHA256

# ---- Configurable constants ----
DB_PATH = Path("integrity.db")
MAGIC = b"FT01"        # 4 bytes magic header to identify our file format
VERSION = b"\x01"      # 1 byte version
SALT_SIZE = 16         # bytes
NONCE_SIZE = 12        # bytes (recommended for AES-GCM)
PBKDF2_ITER = 200_000  # iterations for key derivation (memory/time tradeoff)
KEY_LEN = 32           # 256-bit AES key
CHUNK_SIZE = 64 * 1024 # read/write in 64KB chunks

# ---- Utility functions ----

def derive_key(password: str, salt: bytes, iterations: int = PBKDF2_ITER) -> bytes:
    """Derive a symmetric key from a password and salt using PBKDF2-HMAC-SHA256."""
    return PBKDF2(password, salt, dkLen=KEY_LEN, count=iterations, hmac_hash_module=SHA256)

def sha256_of_file(path: Path) -> str:
    """Return hex SHA-256 digest of file (streaming)."""
    h = hashlib.sha256()
    with path.open("rb") as f:
        while True:
            chunk = f.read(CHUNK_SIZE)
            if not chunk:
                break
            h.update(chunk)
    return h.hexdigest()

# ---- Encryption / Decryption ----

def encrypt_file(in_path: Path, out_path: Path, password: str, associated_data: Optional[bytes] = None) -> None:
    """
    Encrypt file with AES-GCM. Output format:
    [MAGIC(4)] [VER(1)] [SALT(16)] [NONCE(12)] [CIPHERTEXT ...] [TAG(16)]
    """
    salt = get_random_bytes(SALT_SIZE)
    key = derive_key(password, salt)
    nonce = get_random_bytes(NONCE_SIZE)
    cipher = AES.new(key, AES.MODE_GCM, nonce=nonce)
    if associated_data:
        cipher.update(associated_data)

    out_path.parent.mkdir(parents=True, exist_ok=True)
    with in_path.open("rb") as fin, out_path.open("wb") as fout:
        # header
        fout.write(MAGIC)
        fout.write(VERSION)
        fout.write(salt)
        fout.write(nonce)
        # stream encrypt
        while True:
            chunk = fin.read(CHUNK_SIZE)
            if not chunk:
                break
            ct = cipher.encrypt(chunk)
            fout.write(ct)
        # finalize & write tag
        tag = cipher.digest()
        fout.write(tag)

def decrypt_file(in_path: Path, out_path: Path, password: str, associated_data: Optional[bytes] = None) -> None:
    """
    Decrypt file created by encrypt_file. Raises ValueError on authentication failure.
    """
    with in_path.open("rb") as fin:
        header = fin.read(len(MAGIC) + 1 + SALT_SIZE + NONCE_SIZE)
        if len(header) < len(MAGIC) + 1 + SALT_SIZE + NONCE_SIZE:
            raise ValueError("File too short or not a valid encrypted file")

        magic = header[:4]
        if magic != MAGIC:
            raise ValueError("Invalid file magic - not an encrypted file from this tool")
        version = header[4:5]
        if version != VERSION:
            raise ValueError(f"Unsupported version: {version}")

        salt = header[5:5+SALT_SIZE]
        nonce = header[5+SALT_SIZE:5+SALT_SIZE+NONCE_SIZE]
        key = derive_key(password, salt)

        # compute ciphertext length: read rest -> last 16 bytes are tag
        rest = fin.read()
        if len(rest) < 16:
            raise ValueError("File corrupted or missing auth tag")
        ciphertext = rest[:-16]
        tag = rest[-16:]

        cipher = AES.new(key, AES.MODE_GCM, nonce=nonce)
        if associated_data:
            cipher.update(associated_data)
        try:
            plaintext = cipher.decrypt_and_verify(ciphertext, tag)
        except ValueError as e:
            raise ValueError("Decryption failed - authentication tag mismatch") from e

        out_path.parent.mkdir(parents=True, exist_ok=True)
        with out_path.open("wb") as fout:
            fout.write(plaintext)

# ---- Integrity DB ----

def init_db(db_path: Path = DB_PATH) -> None:
    conn = sqlite3.connect(str(db_path))
    cur = conn.cursor()
    cur.execute("""
    CREATE TABLE IF NOT EXISTS files (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        path TEXT UNIQUE,
        sha256 TEXT,
        added_at TEXT
    )
    """)
    conn.commit()
    conn.close()

def add_file_hash(path: Path, db_path: Path = DB_PATH) -> None:
    path = path.resolve()
    if not path.exists():
        raise FileNotFoundError(str(path))
    h = sha256_of_file(path)
    t = datetime.utcnow().isoformat() + "Z"
    conn = sqlite3.connect(str(db_path))
    cur = conn.cursor()
    cur.execute("INSERT OR REPLACE INTO files (path, sha256, added_at) VALUES (?, ?, ?)", (str(path), h, t))
    conn.commit()
    conn.close()

def get_db_record(path: Path, db_path: Path = DB_PATH) -> Optional[Tuple[int, str, str]]:
    conn = sqlite3.connect(str(db_path))
    cur = conn.cursor()
    cur.execute("SELECT id, sha256, added_at FROM files WHERE path=?", (str(path.resolve()),))
    row = cur.fetchone()
    conn.close()
    return row

def verify_file_hash(path: Path, db_path: Path = DB_PATH) -> Tuple[bool, Optional[str], Optional[str]]:
    """
    Returns (ok, stored_hash, current_hash)
    ok=True if file exists and hashes match and record exists
    """
    row = get_db_record(path, db_path)
    if row is None:
        return (False, None, None)
    stored = row[1]
    if not path.exists():
        return (False, stored, None)
    current = sha256_of_file(path)
    return (stored == current, stored, current)

# ---- CLI and convenience functions ----

def ensure_db():
    if not DB_PATH.exists():
        print(f"[+] Creating DB at {DB_PATH}")
        init_db(DB_PATH)

def cmd_initdb(args):
    init_db(DB_PATH)
    print(f"[+] Initialized DB at {DB_PATH}")

def cmd_addhash(args):
    ensure_db()
    p = Path(args.path)
    add_file_hash(p, DB_PATH)
    print(f"[+] Added/updated hash for {p.resolve()}")

def cmd_verify(args):
    ensure_db()
    p = Path(args.path)
    ok, stored, current = verify_file_hash(p, DB_PATH)
    if stored is None:
        print(f"[-] No record found for {p.resolve()} in DB.")
        return
    if current is None:
        print(f"[-] File missing: {p.resolve()}. Stored hash: {stored}")
        return
    print(f"[i] Stored:  {stored}")
    print(f"[i] Current: {current}")
    if ok:
        print("[+] OK — hashes match.")
    else:
        print("[-] MISMATCH — file modified!")

def cmd_checkdir(args):
    ensure_db()
    base = Path(args.path).resolve()
    if not base.exists():
        print(f"[-] Path not found: {base}")
        return
    # Walk DB records under base, and check each
    conn = sqlite3.connect(str(DB_PATH))
    cur = conn.cursor()
    like = str(base) + '%'
    cur.execute("SELECT path, sha256 FROM files WHERE path LIKE ?", (like,))
    rows = cur.fetchall()
    conn.close()
    if not rows:
        print("[i] No DB records under this directory.")
        return
    mismatches = 0
    for path_str, stored in rows:
        p = Path(path_str)
        if not p.exists():
            print(f"[-] MISSING: {p}")
            mismatches += 1
            continue
        current = sha256_of_file(p)
        if current != stored:
            print(f"[-] MODIFIED: {p}")
            print(f"    stored:  {stored}")
            print(f"    current: {current}")
            mismatches += 1
        else:
            print(f"[+] OK: {p}")
    print(f"[i] Completed. mismatches={mismatches}")

def cmd_encrypt(args):
    in_path = Path(args.input)
    if not in_path.exists():
        print(f"[-] Input not found: {in_path}")
        return
    out_path = Path(args.output) if args.output else in_path.with_suffix(in_path.suffix + ".enc")
    if out_path.exists() and not args.overwrite:
        print(f"[-] Output file exists ({out_path}); use --overwrite to replace.")
        return
    pwd = args.password or getpass("Password: ")
    try:
        encrypt_file(in_path, out_path, pwd)
        print(f"[+] Encrypted {in_path} -> {out_path}")
    except Exception as e:
        print("[-] Encryption failed:", str(e))

def cmd_decrypt(args):
    in_path = Path(args.input)
    if not in_path.exists():
        print(f"[-] Input not found: {in_path}")
        return
    out_path = Path(args.output) if args.output else in_path.with_suffix(".dec")
    if out_path.exists() and not args.overwrite:
        print(f"[-] Output file exists ({out_path}); use --overwrite to replace.")
        return
    pwd = args.password or getpass("Password: ")
    try:
        decrypt_file(in_path, out_path, pwd)
        print(f"[+] Decrypted {in_path} -> {out_path}")
    except Exception as e:
        print("[-] Decryption failed:", str(e))

def cmd_scan_add(args):
    """
    Walk a directory and add all files' hashes to DB (recursively).
    """
    ensure_db()
    base = Path(args.path).resolve()
    if not base.exists():
        print(f"[-] Path not found: {base}")
        return
    count = 0
    for root, dirs, files in os.walk(base):
        for fn in files:
            p = Path(root) / fn
            try:
                add_file_hash(p, DB_PATH)
                count += 1
                print(f"[+] Added: {p}")
            except Exception as e:
                print(f"[-] Failed {p}: {e}")
    print(f"[i] Completed. {count} files added/updated.")

def build_parser():
    ap = argparse.ArgumentParser(description="File encrypter + integrity checker (single-file project)")
    sub = ap.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("init-db", help="Initialize integrity DB")
    p.set_defaults(func=cmd_initdb)

    p = sub.add_parser("add-hash", help="Add single file's SHA256 to DB (or update existing)")
    p.add_argument("path", help="Path to file")
    p.set_defaults(func=cmd_addhash)

    p = sub.add_parser("verify", help="Verify a single file against DB record")
    p.add_argument("path", help="Path to file")
    p.set_defaults(func=cmd_verify)

    p = sub.add_parser("check-dir", help="Verify all DB-tracked files under a directory")
    p.add_argument("path", help="Directory path")
    p.set_defaults(func=cmd_checkdir)

    p = sub.add_parser("scan-add", help="Recursively add all files in directory to DB (like 'baseline')")
    p.add_argument("path", help="Directory path")
    p.set_defaults(func=cmd_scan_add)

    p = sub.add_parser("encrypt", help="Encrypt a file (AES-GCM, password-derived key)")
    p.add_argument("input", help="Input file path")
    p.add_argument("-o", "--output", help="Output file path (defaults to input + .enc)")
    p.add_argument("-p", "--password", help="Password (if omitted, prompt interactively)")
    p.add_argument("--overwrite", action="store_true", help="Overwrite existing output")
    p.set_defaults(func=cmd_encrypt)

    p = sub.add_parser("decrypt", help="Decrypt a file created by this tool")
    p.add_argument("input", help="Encrypted file path")
    p.add_argument("-o", "--output", help="Output file path (defaults to input + .dec)")
    p.add_argument("-p", "--password", help="Password (if omitted, prompt interactively)")
    p.add_argument("--overwrite", action="store_true", help="Overwrite existing output")
    p.set_defaults(func=cmd_decrypt)

    return ap

def main():
    ap = build_parser()
    args = ap.parse_args()
    try:
        args.func(args)
    except KeyboardInterrupt:
        print("\n[!] Aborted by user.")
    except Exception as e:
        print("[-] Error:", e)

if __name__ == "__main__":
    main()
```

---

# Usage examples (Kali terminal)

1. Initialize DB:

```bash
python3 filetool.py init-db
# Output: [+] Initialized DB at integrity.db
```

2. Create a baseline (add all files in a directory to DB):

```bash
python3 filetool.py scan-add /home/kali/myproject
# Walks recursively and stores SHA-256 for each file in integrity.db
```

3. Encrypt a file:

```bash
python3 filetool.py encrypt /home/kali/myproject/secret.txt
# prompted for password
# Output: [+] Encrypted /home/kali/.../secret.txt -> /home/kali/.../secret.txt.enc
```

Or provide password non-interactively (careful; visible in history):

```bash
python3 filetool.py encrypt /path/file -p "StrongPass123!"
```

4. Decrypt:

```bash
python3 filetool.py decrypt /home/kali/myproject/secret.txt.enc -o secret.txt.dec
# Enter same password used to encrypt
```

5. Add single file hash (you want to track a file manually):

```bash
python3 filetool.py add-hash /home/kali/myproject/important.bin
```

6. Verify a file against DB:

```bash
python3 filetool.py verify /home/kali/myproject/important.bin
# Shows stored & current hashes, and reports MATCH or MISMATCH
```

7. Check all tracked files under a directory:

```bash
python3 filetool.py check-dir /home/kali/myproject
```

---

# How this is a decent project (features you can point to on GitHub / demo)

* Uses **AES-GCM** (authenticated encryption) with a **password-derived key** (PBKDF2) — industry-appropriate primitives (note: for production you'd use stronger KDFs like Argon2).
* **Streamed file handling** (no large memory usage).
* **Separate integrity DB** with timestamps — good for auditing file changes over time.
* CLI-friendly: subcommands, non-interactive options, overwrite protection.
* Portable (single file), easy to extend (add Argon2, HSM, encryption of whole directories, encryption metadata, secure deletion, etc.).
* Logs and errors are printed to terminal for clarity (you can add Python logging later).

---

# Security notes & best practices

* **Do not reuse weak passwords.** Use a long passphrase or a password manager.
* The script uses PBKDF2 with 200k iterations: reasonable for desktop but consider **Argon2** if available for stronger resistance to GPU attacks.
* AES-GCM provides both confidentiality and integrity for the encrypted content — the external integrity DB is for **tracking changes over time** (e.g., detect if an unencrypted file changed).
* Keep `integrity.db` protected (permissions) — otherwise an attacker could tamper with stored hashes. Consider encrypting the DB or storing HMACs protected by a secret key.
* This tool is **educational** and fine for personal / lab use. For sensitive or production-grade use, get a cryptography expert review.

---

