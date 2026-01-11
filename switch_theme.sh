#!/bin/bash

# PrinceTheme Variant Switcher
# Author: PrinceTheProgrammer

# Import Localization
if [ -f "lib/i18n.sh" ]; then
    source lib/i18n.sh
elif [ -f "/boot/grub/themes/PrinceTheme/lib/i18n.sh" ]; then
    source /boot/grub/themes/PrinceTheme/lib/i18n.sh
fi

THEME_DIR="/boot/grub/themes/PrinceTheme"
VARIANTS_DIR="$THEME_DIR/variants"

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Check root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}${MSG_ROOT_REQUIRED}${NC}"
  exit 1
fi

if [ ! -d "$THEME_DIR" ]; then
    echo -e "${RED}PrinceTheme is not installed in $THEME_DIR.${NC}"
    echo "Please run install.sh first."
    exit 1
fi

echo -e "${CYAN}=== ${MSG_WELCOME} Switcher ===${NC}"
echo "${MSG_SELECT_THEME}"
echo ""

# Get list of variants
variants=($(ls "$VARIANTS_DIR"/*.txt))
count=${#variants[@]}

if [ $count -eq 0 ]; then
    echo -e "${RED}No variants found in $VARIANTS_DIR!${NC}"
    exit 1
fi

# Display menu
for ((i=0; i<$count; i++)); do
    filename=$(basename "${variants[$i]}")
    echo -e "${YELLOW}[$i]${NC} $filename"
done

echo ""
read -p "Enter number (0-$(($count-1))): " choice

# Validate input
if [[ ! "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -ge "$count" ] || [ "$choice" -lt 0 ]; then
    echo -e "${RED}Invalid selection.${NC}"
    exit 1
fi

selected_variant="${variants[$choice]}"
echo -e "${MSG_COPYING} ${GREEN}$(basename "$selected_variant")${NC}"

# Apply theme
cp "$selected_variant" "$THEME_DIR/theme.txt"

# Update GRUB
echo "${MSG_UPDATING}"
if command -v update-grub &> /dev/null; then
    update-grub
elif command -v grub-mkconfig &> /dev/null; then
    grub-mkconfig -o /boot/grub/grub.cfg
else
    echo -e "${RED}${MSG_NOT_FOUND}${NC}"
fi

echo -e "${GREEN}${MSG_SUCCESS}${NC}"