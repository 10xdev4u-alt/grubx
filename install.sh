#!/bin/bash

# PrinceTheme Installer
# Author: PrinceTheProgrammer

# Import Localization
source lib/i18n.sh

THEME_DIR="/boot/grub/themes"
THEME_NAME="PrinceTheme"
INSTALL_PATH="$THEME_DIR/$THEME_NAME"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}${MSG_STARTING}${NC}"

# Check for root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}${MSG_ROOT_REQUIRED}${NC}"
  exit 1
fi

# Create themes directory if it doesn't exist
if [ ! -d "$THEME_DIR" ]; then
  mkdir -p "$THEME_DIR"
  echo "${MSG_CREATED_DIR} $THEME_DIR"
fi

# Remove old theme if exists
if [ -d "$INSTALL_PATH" ]; then
  echo "${MSG_REMOVING_OLD}"
  rm -rf "$INSTALL_PATH"
fi

# Copy theme
echo "${MSG_COPYING}"
cp -r "$THEME_NAME" "$THEME_DIR"
# Copy locales and lib for the scripts to use later
mkdir -p "$INSTALL_PATH/locales"
mkdir -p "$INSTALL_PATH/lib"
cp locales/*.sh "$INSTALL_PATH/locales/"
cp lib/*.sh "$INSTALL_PATH/lib/"

# Configure GRUB
echo "${MSG_CONFIGURING}"

# Check if GRUB_THEME is already set
if grep -q "GRUB_THEME=" /etc/default/grub; then
  sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"$INSTALL_PATH/theme.txt\"|" /etc/default/grub
else
  echo "GRUB_THEME=\"$INSTALL_PATH/theme.txt\"" >> /etc/default/grub
fi

# Update GRUB
echo "${MSG_UPDATING}"
if command -v update-grub &> /dev/null; then
    update-grub
elif command -v grub-mkconfig &> /dev/null; then
    grub-mkconfig -o /boot/grub/grub.cfg
else
    echo -e "${RED}${MSG_NOT_FOUND}${NC}"
fi

echo -e "${GREEN}${MSG_COMPLETE}${NC}"