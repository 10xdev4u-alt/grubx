# Security Setup

In an Enterprise environment, you don't want just anyone editing your boot parameters (e.g., booting into single-user mode to reset the root password).

## Setting a Superuser
You can lock GRUB so that a password is required to edit entries or even to boot specific OSs.

1.  **Generate a hash:**
    ```bash
    grub-mkpasswd-pbkdf2
    ```
    Enter your desired password. Copy the long string starting with `grub.pbkdf2...`.

2.  **Edit `/etc/grub.d/00_header` (or `40_custom`):**
    Add:
    ```
    set superusers="admin"
    password_pbkdf2 admin grub.pbkdf2.sha512.10000.BIGLONGHASH...
    ```

3.  **Update GRUB:**
    `sudo update-grub`

## How it affects the Theme
The theme itself doesn't change, but GRUB will present a generic text-based login prompt *over* the theme when you try to edit an entry (`e`).

## Protecting Specific Menu Entries
In `grub.cfg`, you can add `--users admin` to specific menu entries to lock them down.

**Warning:** If you lose this password, you might need a live USB to rescue your system.
