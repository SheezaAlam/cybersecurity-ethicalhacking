
# Reverse Engineering Basics (Ghidra & OllyDbg)

## What is Reverse Engineering?

Reverse engineering is taking a program’s compiled code (for example, an `.exe`) and converting it back into a human-readable form (like assembly or decompiled C) so we can understand how it works internally.
**Analogy:** It’s like opening a toy car to see its motor and gears.

## Why it matters in malware analysis

Reverse engineering helps analysts:

* Identify hidden malicious behavior inside binaries.
* Understand new or unknown malware families.
* Extract Indicators of Compromise (IoCs) — e.g., IPs, domains, file paths, registry changes.
* Create defensive rules and signatures for antivirus/IDS.
* Reveal payloads (what the malware actually does: data theft, encryption, keylogging, etc.).
* Find anti-analysis or obfuscation tricks attackers use to hide their code.

---

## Stages of Reverse Engineering

1. **Preparation**

   * Create a safe lab (virtual machine, snapshots, host-only network/no internet).
   * Gather tools (Ghidra, OllyDbg, network capture tools, etc.).
2. **Static Examination**

   * Inspect file structure without running it (strings, imports, headers).
   * Use disassembler/decompiler (Ghidra) to read code and find suspicious parts.
3. **Dynamic Examination**

   * Run the program in a controlled debugger/sandbox (OllyDbg) to observe runtime behavior.
   * Step through code, set breakpoints, and observe memory/registers.

> Note: Don’t run malware on your host machine — always use isolated VMs.

---

## Ghidra — static analysis tool

**What it does**

* Converts binaries to assembly and a C-like decompiled view.
* Shows imports, strings, function graphs, and code flow.

**Key features**

* Multi-platform, free and open-source.
* Decompiler view (easier to understand than raw assembly).
* Function graphs and built-in annotations.

**Useful checks in Ghidra**

* **Imports** → what API functions does the program call?
  *Examples:* `CreateFileA`, `WriteFile`, `InternetOpenUrlA`, `CreateProcessA`, `GetAsyncKeyState`, `CryptEncrypt`.
* **Strings** → file paths, URLs, commands, keys, error messages.
* **Function cross-references** → see where file/network functions are used.
* **Function graphs** → visualize program flow and connected logic.

**What imports often indicate**

* `CreateFileA` / `WriteFile` → file creation/modification (data theft, persistence, ransom).
* `InternetOpenUrlA` → network activity (exfiltration or C2).
* `GetAsyncKeyState` → keylogging.
* `CryptEncrypt` → encryption routines (possible ransomware).

---

## OllyDbg — dynamic analysis / debugger

**What it does**

* Runs programs in a controlled way, letting you step through instructions.
* Shows CPU instructions, registers, stack, and memory.

**Core actions**

* Load executables and set breakpoints.
* Step through instructions line-by-line.
* Observe memory and register changes.
* Inspect runtime-decrypted code or injected code.

**Why use OllyDbg**

* Confirms behavior that static analysis can’t (e.g., runtime decryption).
* Reveals process injection, network activity, and values only visible when running.

**Example use**

* Pause the program before it connects to an IP to see what data is sent and whether it’s encrypted.

---

## Obfuscation & Anti-analysis (simple explanation)

* **Obfuscation:** Hiding the program’s intent (e.g., encrypting strings, renaming functions, adding junk code).
  *Goal:* Make the code hard to read and slow down static analysis.
* **Anti-analysis:** Techniques that detect analysis environments and change behavior (e.g., debugger/VM checks, long sleeps, runtime checks).
  *Goal:* Prevent dynamic analysis or make it take much longer.

**Common obfuscation techniques**

* Identifier renaming (meaningless function/variable names).
* String encryption and decoding at runtime.
* Control-flow obfuscation (jumbling logical flow).
* Packing (compressed/encrypted executable that unpacks in memory).
* Inserting junk/dead code.

**Common anti-analysis techniques**

* VM/sandbox detection (looking for VirtualBox/VMware artifacts).
* Debugger detection (checking for breakpoints, debugger APIs).
* Long sleeps or timing checks to detect sandboxes.
* Self-modifying or runtime-decrypted code.
* Process injection and hollowing.

**How analysts handle them**

* Combine static and dynamic analysis.
* Dump memory to extract unpacked code.
* Use specialized tools (Frida, x64dbg, WinDbg).
* Make the analysis VM look like a real machine (add files/users).
* Use automated unpackers or deobfuscation scripts where available.

---

## Comparison: Ghidra vs OllyDbg

| Aspect     | Ghidra                         | OllyDbg                                            |
| ---------- | ------------------------------ | -------------------------------------------------- |
| Type       | Static                         | Dynamic                                            |
| Runs code? | No                             | Yes                                                |
| Focus      | Code structure & decompilation | Runtime behavior & execution flow                  |
| Safety     | Safer (no execution)           | Riskier (needs isolated VM)                        |
| Best for   | First look, locating IoCs      | Confirming runtime behavior, stepping through code |

**Recommended flow:** Start with Ghidra (overview) → Move to OllyDbg (confirm and inspect runtime behavior).

---

## Lab Safety Checklist

* Use a virtual machine (snapshot before analysis).
* Disable internet or use host-only network.
* Use separate analysis VM and tooling VM.
* Collect forensic snapshots before running (memory & disk).
* Never transfer samples to your host or public repos.

---

## Quick Practical Steps (beginner)

1. Open the binary in Ghidra.
2. Check **Strings** for URLs, file paths, commands.
3. Open **Imports** to see suspicious API calls.
4. Use the **Decompiler** to read key functions in C-like form.
5. If you suspect runtime behavior (packing, encrypted strings), load the sample in OllyDbg inside an isolated VM.
6. Set breakpoints around network or file APIs and step through to observe behavior.

---


