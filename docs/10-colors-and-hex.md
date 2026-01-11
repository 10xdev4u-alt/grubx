# Colors and Hex Codes

PrinceTheme uses standard Hexadecimal color codes (HTML style).

## Format
`#RRGGBB` or `#RGB`
- `FF0000` = Red
- `00FF00` = Green
- `0000FF` = Blue

## Alpha Channel (Transparency)
GRUB supports alpha transparency in the hex code:
`#RRGGBBAA`
- `AA` ranges from `00` (invisible) to `FF` (solid).

Example: `#00000080` is 50% transparent black.

## Theme Palette (PrinceTheme Defaults)
We use the **Catppuccin** inspired palette:
- **Background:** `#1E1E2E` (Dark Blue-Grey)
- **Text:** `#CDD6F4` (White-ish)
- **Selection:** `#89B4FA` (Blue)
- **Timeout:** `#A6ADC8` (Grey)

## Changing Selection Colors
In `boot_menu`:
```
item_color = "#CDD6F4"          # Normal text
selected_item_color = "#89B4FA" # Highlighted text
```

## Gradient Tricks
GRUB does not support CSS gradients. You must use an image (PNG) if you want a gradient background.
