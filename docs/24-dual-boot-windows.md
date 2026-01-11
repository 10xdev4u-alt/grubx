# Dual Boot Windows

Handling the "enemy" (Windows 11).

## OS Prober
GRUB uses a tool called `os-prober` to find Windows.
Ensure it is installed:
`sudo apt install os-prober`

## Enable it
In `/etc/default/grub`, make sure:
```
GRUB_DISABLE_OS_PROBER=false
```

## Icons for Windows
PrinceTheme includes `windows.png` and `windows11.png`.
GRUB usually detects Windows as class `windows`.

## Troubleshooting
If Windows doesn't show up:
1.  Mount the Windows EFI partition in Linux.
2.  Run `sudo update-grub` again.
3.  Check if `os-prober` outputs anything when run manually.

## Theming the Windows Entry
You cannot theme the Windows Boot Manager itself. You are only theming the *choice* to launch it.
