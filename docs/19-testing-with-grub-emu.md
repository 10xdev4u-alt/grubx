# Testing with GRUB Emu

**STOP!** Do not reboot your computer to test every pixel change. That is madness.

## Meet `grub-emu`
It's an emulator that runs GRUB in a window inside your Linux desktop.

## Installation
- **Ubuntu/Debian:** `sudo apt install grub-emu`
- **Arch:** `sudo pacman -S grub` (included)

## Usage
Run this command in your terminal:
```bash
grub-emu
```

## Testing Your Theme
You can tell `grub-emu` to load your specific theme file without installing it system-wide (sometimes).
However, the most reliable way is:
1.  Install the theme (`sudo ./install.sh`).
2.  Run `sudo grub-emu`.

## Limitations
- It cannot actually boot an OS.
- Resolution handling might behave slightly differently than "real" hardware.
- It might not load your actual `grub.cfg` entries perfectly, often showing dummy entries.

## Why it's essential
It saves you 2 minutes per iteration. If you make 30 changes, you saved an hour.
