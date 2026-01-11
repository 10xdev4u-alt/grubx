#!/bin/bash

# PrinceTheme Font Switcher
# Author: PrinceTheProgrammer

# Import Localization
if [ -f "lib/i18n.sh" ]; then
    source lib/i18n.sh
elif [ -f "/boot/grub/themes/PrinceTheme/lib/i18n.sh" ]; then
    source /boot/grub/themes/PrinceTheme/lib/i18n.sh
fi

THEME_DIR="/boot/grub/themes/PrinceTheme"
FONTS_DIR="$THEME_DIR/fonts"

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

echo -e "${CYAN}=== Font Switcher ===${NC}"

# Get list of fonts
fonts=($(ls "$FONTS_DIR"/*.pf2))
count=${#fonts[@]}

if [ $count -eq 0 ]; then
    echo -e "${RED}No fonts found in $FONTS_DIR!${NC}"
    echo "Run tools/font_wizard.sh to generate some."
    exit 1
fi

# Display menu
for ((i=0; i<$count; i++)); do
    filename=$(basename "${fonts[$i]}")
    echo -e "${YELLOW}[$i]${NC} $filename"
done

echo ""
read -p "Enter number (0-$(($count-1))): " choice

# Validate input
if [[ ! "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -ge "$count" ] || [ "$choice" -lt 0 ]; then
    echo -e "${RED}Invalid selection.${NC}"
    exit 1
fi

selected_font="${fonts[$choice]}"
echo -e "${MSG_COPYING} ${GREEN}$(basename "$selected_font")${NC}"

# Apply font (Overwrite the main font.pf2)
cp "$selected_font" "$THEME_DIR/font.pf2"

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
