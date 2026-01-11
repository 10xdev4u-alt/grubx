# PrinceTheme - The Ultimate GRUB Theme

![PrinceTheme Logo](PrinceTheme/logo.png)

## Overview
Welcome to **PrinceTheme**, an Enterprise-Grade, highly polished GRUB bootloader theme designed for modern systems. This theme features a clean, minimal aesthetic with a focus on readability and style. It includes high-quality icons, a custom font, and a sleek selection interface.

## Features
- **Modern Design:** Dark mode inspired with `#1E1E2E` background.
- **High Res Icons:** Comprehensive support for popular Linux distributions.
- **Custom Fonts:** Uses `font.pf2` for crisp text rendering.
- **Automated Install:** Simple one-click installation script.
- **Variants:** Includes multiple layout options to suit your taste.

## Installation

### Automated Installation (Recommended)
Run the following command in your terminal:

```bash
sudo ./install.sh
```

### Manual Installation
1. Copy the `PrinceTheme` folder to `/boot/grub/themes/`.
2. Edit `/etc/default/grub` and set `GRUB_THEME="/boot/grub/themes/PrinceTheme/theme.txt"`.
3. Update grub:
   - Debian/Ubuntu: `sudo update-grub`
   - Arch/Fedora: `sudo grub-mkconfig -o /boot/grub/grub.cfg`

## Structure
- `PrinceTheme/`: Main theme files.
- `PrinceTheme/icons/`: OS icons.
- `PrinceTheme/variants/`: Alternative layout configurations.

## Contributing
We welcome contributions! Please see `CONTRIBUTING.md` for details.

## License
MIT License. See `LICENSE` for more information.

---
*Crafted with 🔥 by PrinceTheProgrammer*
