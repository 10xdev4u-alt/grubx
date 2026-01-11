# Scripting Automation

The `install.sh` script is the bridge between a folder of files and a working theme.

## How it Works

1.  **Root Check:**
    ```bash
    if [ "$EUID" -ne 0 ]; then ...
    ```
    Ensures the user has permission to write to `/boot`.

2.  **Directory Creation:**
    Creates `/boot/grub/themes/PrinceTheme` if it doesn't exist.

3.  **Config Manipulation (`sed`):**
    This is the dangerous part. We use `sed` (Stream Editor) to search for `GRUB_THEME=...` in `/etc/default/grub`.
    - If found: Replace the line.
    - If not found: Append the line to the end.

4.  **Update Command:**
    Detects if the system uses `update-grub` (Debian-based) or `grub-mkconfig` (Arch/Fedora) and runs the appropriate command.

## Writing Your Own Scripts
If you fork this project, you might want to add:
- **Resolution detection:** Automatically pick a `theme_4k.txt`.
- **Distro detection:** Automatically copy the correct logo.

## Safety
Always backup `/etc/default/grub` before running regex replacements on it!
