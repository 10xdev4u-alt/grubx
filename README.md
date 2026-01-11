# PrinceTheme - The Ultimate GRUB Theme

![PrinceTheme Logo](PrinceTheme/logo.png)

![Build Status](https://img.shields.io/github/actions/workflow/status/PrinceTheProgrammer/PrinceTheme/ci.yml?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge)
![Themes](https://img.shields.io/badge/themes-100%2B-purple?style=for-the-badge)

## Overview
Welcome to **PrinceTheme**, an Enterprise-Grade, highly polished GRUB bootloader theme designed for modern systems. This theme features a clean, minimal aesthetic with a focus on readability and style. It includes high-quality icons, a custom font, and a sleek selection interface.

## Features
- **Modern Design:** Dark mode inspired with `#1E1E2E` background.
- **High Res Icons:** Comprehensive support for popular Linux distributions.
- **Custom Fonts:** Uses `font.pf2` for crisp text rendering.
- **Automated Install:** Simple one-click installation script.
- **Variants:** Includes multiple layout options to suit your taste.

### 🌐 Web Gallery
Want to see them before you install? We have generated a static HTML gallery.
Open `docs/gallery.html` in your browser to visualize all 100+ themes instantly.

### 📦 CI/CD & Automation
This project is now **Enterprise Certified**.
- **GitHub Actions:** Automatically validates all themes on every push.
- **Debian Packaging:** Build your own `.deb` file using `packaging/build_deb.sh`.

### 🛠️ Developer SDK
We provide a Python SDK to manage themes programmatically.

```bash
# Install the SDK
pip install .

# Use the CLI
princetheme check --dir PrinceTheme/variants
princetheme build
princetheme gallery
```

### 🅰️ Font Management
PrinceTheme supports custom fonts!
1.  **Generate Fonts:** Run `sudo tools/font_wizard.sh` to find and convert your system fonts (Hack, FiraCode, etc.) to GRUB format.
2.  **Switch Fonts:** Run `sudo ./switch_font.sh` to pick your active font.

### 🌍 Language Support (i18n)
PrinceTheme now speaks your language! Supported languages:
- **English** (Default)
- **Tamil** (தமிழ்)
- **Spanish** (Español)

To switch languages, run:
```bash
./set_language.sh
```

### 🛒 PrinceTheme Store
For the ultimate experience, use our interactive TUI (Terminal User Interface) Store.
It allows you to browse and install any of the 100+ themes graphically.

```bash
sudo ./theme_store.sh
```

### 🎨 The 100 Theme Collection
We didn't just stop at 3. We built an engine to generate **100+ Unique Variants**.
From `Dracula` to `Matrix` to `CyberYellow`, we have it all.

You can find them all in the `PrinceTheme/variants/` folder.

**Want to make your own?**
Check out `tools/generate_themes.py`. You can add your own color palettes and regenerate the entire suite in seconds.

## Variants
We now include multiple style variants out of the box!
- **Default:** The classic polished look.
- **Cyberpunk:** Neon colors and right-aligned menu.
- **Minimal:** No icons, no clutter, just text.
- **Retro:** Hacker-style green on black terminal look.

### Switching Variants
You can easily switch between themes using our new script:

```bash
sudo ./switch_theme.sh
```
This will show you a menu of available styles and apply your choice instantly.

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

## Credits
- **PrinceTheProgrammer**: Lead Architect.
- **Community**: For the inspiration behind the 100+ variants.
- **Open Source**: Built on the shoulders of giants.

---
*Crafted with 🔥 by PrinceTheProgrammer*
