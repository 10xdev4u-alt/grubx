# Installation Guide

We offer two ways to install PrinceTheme: **Automated** (recommended) and **Manual**.

## 🚀 Option 1: Automated Installation

The easiest way to get up and running.

1.  **Open your terminal.**
2.  **Navigate to the folder** where you downloaded PrinceTheme.
3.  **Run the script:**
    ```bash
    sudo ./install.sh
    ```
4.  **Enter your password** when prompted.
5.  **Wait** for the "Installation Complete" message.
6.  **Reboot** to see the magic!

## 🛠️ Option 2: Manual Installation

For those who like total control.

1.  **Create the themes directory:**
    ```bash
    sudo mkdir -p /boot/grub/themes/
    ```

2.  **Copy the files:**
    ```bash
    sudo cp -r PrinceTheme /boot/grub/themes/
    ```

3.  **Edit GRUB config:**
    Open `/etc/default/grub` in your favorite editor:
    ```bash
    sudo nano /etc/default/grub
    ```
    Find the line `GRUB_THEME` and change it to:
    ```bash
    GRUB_THEME="/boot/grub/themes/PrinceTheme/theme.txt"
    ```
    *(If the line doesn't exist, add it at the bottom).*

4.  **Update GRUB:**
    *   **Debian/Ubuntu:** `sudo update-grub`
    *   **Arch/Fedora:** `sudo grub-mkconfig -o /boot/grub/grub.cfg`

## Verification
After rebooting, if you see the PrinceTheme logo, you did it!
