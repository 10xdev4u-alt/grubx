# Animations and GFXMenu

Can GRUB run Crysis? No. But it can do simple animations.

## Limitations
GRUB is not a web browser. It has no CSS3 animations, no JavaScript, and no video player.

## Frame-by-Frame Animation
You can create an animation by cycling through a sequence of images.
*Note: This is resource-intensive and can slow down boot times.*

## How to do it
1.  Create `frame_01.png`, `frame_02.png`, ...
2.  There is no native "animation" component in standard GRUB theming without patching.

## The "GIF" Myth
You cannot just drop a `.gif` file in.

## What PrinceTheme Uses
We stick to **Static Excellence**.
- Hover effects on buttons.
- Clean transitions.

## Advanced: Canvas
Some modified versions of GRUB support extended canvas drawing, but for a universal theme like PrinceTheme, we avoid non-standard features to ensure it works on every distro out of the box.
