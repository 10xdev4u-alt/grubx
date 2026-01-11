# Easter Eggs

Developers love secrets.

## The Secret Key
You can bind a key to a specific action in `theme.txt` (advanced).
*Currently, PrinceTheme has no active easter eggs, but you can add one!*

## Idea: Konami Code?
GRUB doesn't track key history, so complex codes are hard.

## Idea: Hidden Menu
You can set a menu entry to be hidden unless `Shift` is held.
```
if [ "${hold_shift}" = "1" ]; then
  menuentry "Secret OS" { ... }
fi
```

## Adding a "Self Destruct" Label
Add a scary looking label that does nothing:
```
+ label {
    text = "CORE TEMPERATURE: CRITICAL"
    color = "#ff0000"
}
```
(Please don't actually do this in production).
