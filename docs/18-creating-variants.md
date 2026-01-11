# Creating Variants

One size does not fit all. That's why we support variants.

## What is a Variant?
A variant is just an alternative `theme.txt` file that uses the same assets (images/fonts) but arranges them differently.

## Examples
- **`theme_minimal.txt`**: No logo, just text.
- **`theme_left.txt`**: Menu on the left instead of center.
- **`theme_retro.txt`**: Uses a pixel font.

## How to Create One
1.  Copy `theme.txt` to `variants/theme_myvariant.txt`.
2.  Edit the new file.
    - Change `boot_menu { left = ... }`.
    - Change `desktop-image`.
3.  To use it, point your `GRUB_THEME` path to this specific file.

## Best Practice
Keep the shared assets in the root. Do not duplicate `logo.png` unless the variant needs a specifically modified version of it.
