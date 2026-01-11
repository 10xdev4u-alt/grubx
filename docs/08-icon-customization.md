# Icon Customization

PrinceTheme uses an icon set to represent different Operating Systems.

## How GRUB Selects Icons
GRUB looks at the `--class` attribute generated in `grub.cfg` for each menu entry.
If an entry has `--class arch`, GRUB looks for `icons/arch.png`.

## Adding Custom Icons
If you install a niche distro (e.g., "Hannah Montana Linux") and the icon is missing:

1.  **Find a PNG logo:** 32x32 or 48x48 pixels is best.
2.  **Name it correctly:** It must match the class name. Usually the distro name in lowercase.
    - Example: `hannah.png`
3.  **Place it:** Put it in `PrinceTheme/icons/`.

## Debugging Missing Icons
If an icon isn't showing up:
1.  Boot into Linux.
2.  Open `/boot/grub/grub.cfg`.
3.  Search for your menu entry.
4.  Look for the `--class` names listed.
    - Example: `menuentry 'Arch Linux' --class arch --class gnu-linux ...`
5.  Ensure you have an icon named `arch.png` OR `gnu-linux.png`.

## Icon Style
For "PrinceTheme", we prefer flat, minimal icons with transparent backgrounds.
