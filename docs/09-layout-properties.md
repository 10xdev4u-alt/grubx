# Layout Properties

Mastering `left`, `top`, `width`, and `height` is the key to pixel-perfect themes.

## Coordinate System
- **X-axis:** 0 is left, increases to the right.
- **Y-axis:** 0 is top, increases downwards.

## Relative Positioning (%)
Using percentages is responsive and safe for different resolutions.
```
left = 50%  # Starts at the exact center line
```

## Absolute Positioning (px)
```
width = 500 # 500 pixels wide
```

## The "Anchor" Concept
GRUB elements are positioned by their **top-left corner**.
If you want to center an image that is 200px wide:
```
left = 50% - 100
```
(Start at center (50%), then move back half the width (100px)).

## Stacking Order (Z-Index)
GRUB draws elements in the order they appear in `theme.txt`.
- First element = Background (Bottom)
- Last element = Foreground (Top)

**Always define your `boot_menu` last** if you want it to float above other decorative images.
