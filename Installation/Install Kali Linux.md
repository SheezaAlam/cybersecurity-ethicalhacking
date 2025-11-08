# Install Kali Linux on VMware (Step-by-Step Guide)

This document explains how to install **Kali Linux** on **VMware Workstation Player** (Windows 10/11).
It uses the **Installer 64-bit ISO** from the official Kali website, not a prebuilt VM image.

---

## Prerequisites

* 64-bit CPU with virtualization support (**Intel VT-x** or **AMD-V**)
* Minimum: **2 CPU cores**, **4 GB RAM**, **40 GB disk space**
* Recommended: **6–8 GB RAM** for smoother performance
* Windows 10/11 with administrator rights

### Enable Virtualization in BIOS/UEFI

1. Reboot your PC and open BIOS/UEFI setup.
2. Enable **Intel VT-x** or **AMD-V** (sometimes called **SVM**).
3. Save and exit.
4. In Windows, open **Task Manager → Performance → CPU** and confirm: `Virtualization: Enabled`.

### Disable Hyper-V (if VMware conflicts)

Run this command in **Windows Terminal (Admin):**

```powershell
bcdedit /set hypervisorlaunchtype off
```

Restart Windows. Also disable the following in **Windows Features** (if enabled):

* Hyper-V
* Windows Hypervisor Platform
* Virtual Machine Platform

Turn off **Memory Integrity** under: Windows Security → Device Security → Core Isolation.

---

## Required Downloads

1. **Kali Linux Installer ISO (64-bit)**
   Download from the official [Kali Linux website](https://www.kali.org/get-kali/) → *Installer Images*.
   Example filename: `kali-linux-20xx.x-installer-amd64.iso`.

2. **VMware Workstation Player (Windows)**
   Download from VMware’s official site and install with default settings.

### (Optional) Verify ISO Integrity

Run in PowerShell from the folder where the ISO is saved:

```powershell
Get-FileHash .\kali-linux-*-installer-amd64.iso -Algorithm SHA256
```

Compare with the SHA256 hash listed on the Kali downloads page.

---

## Create a Virtual Machine

1. Open **VMware Workstation Player** → *Create a New Virtual Machine*.
2. Select **Installer disc image file (iso)** → browse to the Kali ISO.
3. Guest OS:

   * **Linux**
   * **Debian 12.x 64-bit** (or Debian 11 if 12 is not available)
4. Name the VM: `Kali Linux`.
5. Processors: assign **2 cores** (use more if available).
6. Memory: at least **4096 MB** (6144–8192 MB recommended).
7. Network: **NAT** (safe for beginners).
8. Disk: **40 GB** (store as a single file).
9. Customize Hardware:

   * **Display**: enable *Accelerate 3D graphics*
   * **Guest Isolation**: enable *Copy and paste* and *Drag and drop*
10. Finish.

---

## Install Kali Linux (Inside VMware)

1. Power on the VM → select **Graphical install**.
2. Select language, location, and keyboard layout.
3. Hostname: `kali` (or custom). Leave **Domain name** blank.
4. Create a user and strong password.
5. Time zone: select region.
6. Partitioning:

   * Guided – use entire disk
   * All files in one partition
   * Finish → Write changes to disk → Yes
7. Network mirror: **Yes** (recommended).
8. Install **GRUB** to the primary disk (e.g., `/dev/sda`).
9. Reboot when installation completes.

---

## Post-Installation Setup

### Update and Upgrade

```bash
sudo apt update && sudo apt full-upgrade -y
```

### VMware Guest Tools

```bash
sudo apt install -y open-vm-tools open-vm-tools-desktop
sudo reboot
```

---

## Fixing Common Issues

### GUI Not Loading (tty1 login only)

```bash
sudo apt update
sudo apt install -y kali-desktop-xfce lightdm
sudo systemctl enable lightdm --now
sudo reboot
```

When prompted, choose **lightdm** as the display manager.

### Wrong Time Zone

```bash
sudo dpkg-reconfigure tzdata
```

---

## Recommended Tuning

* **Snapshots:** Take a clean snapshot for rollback.
* **Install Additional Tool Groups:**

```bash
sudo apt install kali-tools-wireless
sudo apt install kali-tools-web
```

* **Networking:** Keep NAT for safety; use Bridged only if required.

---

## Quick Troubleshooting

* **VMX/AMD-V disabled:** Enable virtualization in BIOS/UEFI.

* **Black screen or console login:** Ensure *lightdm* is installed and enabled.

* **No internet in VM:**

  * Check VMware Player → Network Adapter is *Connected (NAT)*
  * Run:

    ```bash
    sudo dhclient -v
    ```

* **VMware vs Hyper-V conflict:** Disable Hyper-V as shown above.

---

## Notes

* This setup uses the **Installer ISO** (more control) instead of prebuilt images.
* NAT networking is recommended for beginners.
* Always keep Kali updated for latest tools and patches.

