# Debugging Boot Issues

You installed a theme and now you have a black screen. Don't panic.

## The Rescue Shell
If GRUB fails to load the theme, it might drop you into:
```
grub rescue>
```

## How to Recover
1.  **List drives:** `ls`
2.  **Find your partition:** `ls (hd0,gpt2)/` (keep trying until you find your filesystem).
3.  **Set root:**
    ```
    set root=(hd0,gpt2)
    set prefix=(hd0,gpt2)/boot/grub
    ```
4.  **Load normal mode:**
    ```
    insmod normal
    normal
    ```

## Removing the Bad Theme
Once you boot into Linux:
1.  Open `/etc/default/grub`.
2.  Comment out the `GRUB_THEME` line:
    ```bash
    # GRUB_THEME="..."
    ```
3.  Update grub: `sudo update-grub`.

## Common Causes
- **Typos** in `theme.txt`.
- **Missing files** (e.g., referenced `logo.png` but it's not there).
- **Wrong path** in `/etc/default/grub`.
