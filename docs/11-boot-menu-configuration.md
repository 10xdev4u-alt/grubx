# Boot Menu Configuration

The `boot_menu` component is the most complex part of the theme.

## Key Properties

### `item_height`
The vertical height of each row in pixels.
- Too small: Text overlaps.
- Too big: Wastes space.
- **PrinceTheme Default:** `45`

### `item_padding`
Space inside the selection box, around the text/icon.

### `item_spacing`
Space *between* the selection boxes of different entries.

### `icon_width` / `icon_height`
Forces icons to a specific size. If your PNGs are different sizes, this normalizes them.

## The Selection Box (`pixmap_style`)
```
selected_item_pixmap_style = "select_*.png"
```
This tells GRUB to look for:
- `select_c.png` (Center/Stretchable part)
- `select_w.png` (West/Left cap)
- `select_e.png` (East/Right cap)

This creates a resizable button that looks good regardless of how long the text is.

## Scrollbars
If you have many OS entries, a scrollbar appears.
```
scrollbar = true
scrollbar_width = 10
scrollbar_thumb = "thumb.png" # Optional custom image
```
