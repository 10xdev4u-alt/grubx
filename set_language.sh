#!/bin/bash

# Utility to switch PrinceTheme Language
# Author: PrinceTheProgrammer

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Select Language / மொழியைத் தேர்ந்தெடுக்கவும் / Seleccionar idioma:${NC}"
echo "1) English"
echo "2) Tamil (தமிழ்)"
echo "3) Spanish (Español)"

read -p "Choice [1-3]: " choice

LANG_CODE="en"

case $choice in
    1) LANG_CODE="en" ;;
    2) LANG_CODE="ta" ;;
    3) LANG_CODE="es" ;;
    *) echo "Invalid choice. Defaulting to English.";;
esac

# Create config file
echo "PRINCE_LANG=$LANG_CODE" > prince.config

echo -e "${GREEN}Language set to $LANG_CODE!${NC}"
echo "Please re-run install.sh or theme_store.sh to see changes."
