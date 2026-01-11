# Font Management

GRUB uses a special font format called **PF2** (PFF2). You cannot simply drop a `.ttf` file in.

## Converting Fonts

To use your favorite font (e.g., Hack, Roboto, Fira Code), you must convert it using `grub-mkfont`.

### Command Syntax
```bash
grub-mkfont -s 24 -o font.pf2 /path/to/myfont.ttf
```

- `-s 24`: Sets the size to 24px.
- `-o font.pf2`: The output filename.

## Installing the Font
1.  Move your new `font.pf2` to `PrinceTheme/`.
2.  Edit `theme.txt` to point to it:
    ```
    terminal-font: "font.pf2"
    ...
    + boot_menu {
        item_font = "font.pf2"
    }
    ```

## Common Fonts
- **Unifont:** The default fail-safe.
- **DejaVu Sans Mono:** Standard Linux console font.
- **Terminus:** crisp bitmap font (great for retro looks).

**Warning:** Large font files can slow down the bootloader slightly. Keep it under 1MB if possible.
