# Resolution Scaling

One of the hardest parts of theming is making it look good on a 4K monitor AND a 720p laptop.

## The Problem
GRUB uses pixels.
- `left = 100` looks huge on 720p.
- `left = 100` looks tiny on 4K.

## The Solution: Percentages
Always prefer `%` over absolute pixels for positioning.
- `left = 50%` is always center.

## Handling Font Sizes
You cannot dynamically scale font sizes. You generally have two options:

1.  **One Size Fits Most:** Use a 24px or 32px font. It's readable on 1080p and acceptable on 4K.
2.  **Variants:** Create `theme_4k.txt` (with huge fonts) and `theme_1080p.txt`.

## Background Scaling
`desktop-image-scale-method: "stretch"` is your friend. It ensures the wallpaper covers the screen regardless of aspect ratio.

## Testing
Use `grub-emu` (covered in guide #19) to test different resolutions:
```bash
grub-emu -r 1920x1080
grub-emu -r 800x600
```
This is crucial for "Enterprise Grade" reliability.
