# Directory Structure

Understanding the anatomy of PrinceTheme.

```text
PrinceTheme/
├── background.png      # The wallpaper image (1920x1080 usually)
├── logo.png            # The large logo shown in the center
├── font.pf2            # The bitmap font used for text
├── theme.txt           # The BRAIN. Controls layout and logic.
├── icons/              # Folder containing OS icons (Arch, Windows, etc.)
│   ├── arch.png
│   ├── windows.png
│   └── ...
├── select_c.png        # Selection highlight (Center)
├── select_e.png        # Selection highlight (East/Right)
├── select_w.png        # Selection highlight (West/Left)
└── variants/           # Alternate configurations
    ├── theme_v1.txt
    └── theme_v2.txt
```

## Key Files Explained

### `theme.txt`
This is the configuration file interpreted by the GRUB engine. It defines:
- Where the boot menu appears.
- What font to use.
- Colors for text and selection.
- Where the timer is placed.

### `*.pf2` (Fonts)
GRUB does not use `.ttf` or `.otf` files directly. They must be converted to `.pf2` (GRUB Bitmap Font).

### `select_*.png`
These three images create the "highlight" bar when you select an OS. It uses a "sliding door" technique to stretch the bar to fit the text width.
