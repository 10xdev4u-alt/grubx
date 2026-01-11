# Customizing Backgrounds

Changing the vibe of your bootloader starts with the background.

## Requirements
- **Format:** PNG or JPEG (PNG recommended for quality).
- **Resolution:** Ideally native to your monitor (e.g., 1920x1080).
- **Color Depth:** 8-bit RGB (No CMYK).

## How to Change It

1.  **Find an image:** Get a cool wallpaper.
2.  **Rename it:** Name it `background.png`.
3.  **Replace:** Overwrite the existing `PrinceTheme/background.png`.
4.  **Update:** Run `sudo update-grub` (on Debian/Ubuntu) to regenerate the cache.

## Scaling Methods
In `theme.txt`, you can control how the image fits:

```
desktop-image-scale-method: "stretch"
```

Options:
- `"stretch"`: Forces image to fill screen (may distort).
- `"crop"`: Keeps aspect ratio, cuts off edges.
- `"padding"`: Keeps aspect ratio, adds black bars.
- `"best_fit"`: Smart scaling.

## Enterprise Tip
For corporate environments, use a branded background with the company logo subtly watermarked. Ensure high contrast with the text color!
