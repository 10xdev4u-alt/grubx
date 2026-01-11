# UEFI vs BIOS

Legacy vs Modern.

## BIOS (Legacy)
- Uses MBR (Master Boot Record).
- GRUB installs to the MBR of the drive.
- Themes generally work, but resolution support is limited (often stuck at 1024x768).

## UEFI (Modern)
- Uses GPT (GUID Partition Table).
- GRUB is an `.efi` application in the EFI System Partition.
- Graphics support is much better (Native resolution).

## PrinceTheme Compatibility
PrinceTheme is designed for **UEFI** systems primarily.
It *will* work on BIOS, but the high-res background might not load if the VESA mode isn't supported.

## Checking your Mode
Run:
```bash
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "Legacy"
```
