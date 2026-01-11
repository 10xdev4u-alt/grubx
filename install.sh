#!/bin/bash

# PrinceTheme Installer
# Author: PrinceTheProgrammer

THEME_DIR="/boot/grub/themes"
THEME_NAME="PrinceTheme"
INSTALL_PATH="$THEME_DIR/$THEME_NAME"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting PrinceTheme Installation...${NC}"

# Check for root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Please run as root.${NC}"
  exit 1
fi

# Create themes directory if it doesn't exist
if [ ! -d "$THEME_DIR" ]; then
  mkdir -p "$THEME_DIR"
  echo "Created $THEME_DIR"
fi

# Remove old theme if exists
if [ -d "$INSTALL_PATH" ]; then
  echo "Removing old installation..."
  rm -rf "$INSTALL_PATH"
fi

# Copy theme
echo "Copying theme files..."
cp -r "$THEME_NAME" "$THEME_DIR"

# Configure GRUB
echo "Configuring GRUB..."

# Check if GRUB_THEME is already set
if grep -q "GRUB_THEME=" /etc/default/grub; then
  sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"$INSTALL_PATH/theme.txt\"|" /etc/default/grub
else
  echo "GRUB_THEME=\"$INSTALL_PATH/theme.txt\"" >> /etc/default/grub
fi

# Update GRUB
echo "Updating GRUB configuration..."
if command -v update-grub &> /dev/null; then
    update-grub
elif command -v grub-mkconfig &> /dev/null; then
    grub-mkconfig -o /boot/grub/grub.cfg
else
    echo -e "${RED}Could not find update-grub or grub-mkconfig. Please update grub manually.${NC}"
fi

echo -e "${GREEN}Installation Complete! Reboot to see your new theme.${NC}"
