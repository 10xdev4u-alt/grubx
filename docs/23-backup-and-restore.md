# Backup and Restore

Protect your boot config.

## What to Backup
1.  `/etc/default/grub` (The user configuration)
2.  `/boot/grub/grub.cfg` (The generated file - optional but good for reference)
3.  `/boot/grub/themes/` (Your custom themes)

## Restoration Script
Create a script `restore_grub.sh`:
```bash
cp /backup/default_grub /etc/default/grub
cp -r /backup/themes/PrinceTheme /boot/grub/themes/
update-grub
```

## Snapshotting
If you use Btrfs or ZFS, take a snapshot before installing any theme.
```bash
sudo timeshift --create --comments "Before PrinceTheme"
```
This is the ultimate safety net.
