# Progress Bars and Labels

Visualizing the automated boot process.

## Circular Progress?
Sadly, GRUB theme engine primarily supports **Linear** progress bars.
PrinceTheme simulates a clean look using a text countdown.

## The Circular Progress Bar Component
```
+ progress_bar {
    id = "__timeout__"
    left = ...
    width = ...
    text = "text" # Text to display on top
    bar_style = "bar_*.png"
    highlight_style = "highlight_*.png"
}
```
*Note: PrinceTheme currently uses a minimal Label instead of a bar for style reasons, but you can add this back!*

## The Countdown Label
The specific `id = "__timeout__"` is magic. GRUB updates this component every second.

```
+ label {
    id = "__timeout__"
    text = "Booting in %d seconds"
}
```
The `%d` is automatically replaced by the number.

## Customizing the Message
You can change the text to be aggressive or polite:
- "Launch imminent: %d"
- "Hurry up! %d"
- "%d..."

## Hiding it
If you hate the countdown, set `top = -100%` to move it off-screen, or remove the component entirely.
