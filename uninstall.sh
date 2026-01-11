#!/bin/bash

# PrinceTheme Uninstaller
# Author: PrinceTheProgrammer

THEME_DIR="/boot/grub/themes"
THEME_NAME="PrinceTheme"
INSTALL_PATH="$THEME_DIR/$THEME_NAME"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${RED}Starting PrinceTheme Uninstallation...${NC}"

# Check for root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Please run as root.${NC}"
  exit 1
fi

# Remove theme directory
if [ -d "$INSTALL_PATH" ]; then
  echo "Removing theme files..."
  rm -rf "$INSTALL_PATH"
else
  echo "Theme not found."
fi

# Restore GRUB config
echo "Restoring GRUB configuration..."
sed -i '/GRUB_THEME=.*PrinceTheme\/theme.txt/d' /etc/default/grub

# Update GRUB
echo "Updating GRUB configuration..."
if command -v update-grub &> /dev/null; then
    update-grub
elif command -v grub-mkconfig &> /dev/null; then
    grub-mkconfig -o /boot/grub/grub.cfg
else
    echo -e "${RED}Could not find update-grub or grub-mkconfig. Please update grub manually.${NC}"
fi

echo -e "${GREEN}Uninstallation Complete!${NC}"
