#!/bin/bash

# PrinceTheme Store - TUI Interface
# Author: PrinceTheProgrammer

THEME_DIR="/boot/grub/themes/PrinceTheme"
VARIANTS_DIR="./PrinceTheme/variants"
CURRENT_THEME_FILE="$THEME_DIR/theme.txt"

# Colors for non-whiptail output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Check dependencies
if ! command -v whiptail &> /dev/null; then
    echo -e "${RED}Error: 'whiptail' is required for the Prince Store.${NC}"
    echo "Please install it: sudo apt install newt (Debian/Ubuntu) or libnewt (Arch/Fedora)"
    exit 1
fi

# Check root
if [ "$EUID" -ne 0 ]; then
    whiptail --title "Permission Error" --msgbox "You must run Prince Store as root (sudo)." 8 45
    exit 1
fi

# Check installation
if [ ! -d "$THEME_DIR" ]; then
    whiptail --title "Installation Error" --msgbox "PrinceTheme is not installed in /boot/grub/themes.\n\nPlease run install.sh first." 8 60
    exit 1
fi

while true; do
    # Generate list for whiptail
    # Format: "filename" "description"
    # We use a loop to build the array properly
    OPTIONS=()
    
    # Check if variants directory exists locally or in /boot
    SEARCH_DIR=""
    if [ -d "$VARIANTS_DIR" ]; then
        SEARCH_DIR="$VARIANTS_DIR"
    elif [ -d "$THEME_DIR/variants" ]; then
        SEARCH_DIR="$THEME_DIR/variants"
    else
        whiptail --title "Error" --msgbox "Cannot find variants folder." 8 45
        exit 1
    fi

    # Read files and populate options
    # We display the theme name (stripped of 'theme_' and '.txt')
    for file in "$SEARCH_DIR"/theme_*.txt; do
        filename=$(basename "$file")
        clean_name=$(echo "$filename" | sed 's/theme_//' | sed 's/\.txt//' | tr '[:lower:]' '[:upper:]')
        OPTIONS+=("$filename" "$clean_name")
    done

    # Show Menu
    CHOICE=$(whiptail --title "PrinceTheme Store (Enterprise Edition)" \
                      --menu "Select a Theme Variant to Apply:\n(Press ESC to Exit)" \
                      22 70 14 \
                      "${OPTIONS[@]}" \
                      3>&1 1>&2 2>&3)

    EXIT_STATUS=$?

    if [ $EXIT_STATUS -ne 0 ]; then
        echo "Exiting Prince Store. Have a nice day!"
        exit 0
    fi

    # Confirm Selection
    TARGET_FILE="$SEARCH_DIR/$CHOICE"
    
    if (whiptail --title "Confirm Installation" --yesno "Are you sure you want to install the '$CHOICE' variant?" 8 60); then
        
        # Show progress gauge
        {
            echo 10
            sleep 0.2
            echo 30
            cp "$TARGET_FILE" "$THEME_DIR/theme.txt"
            echo 60
            sleep 0.2
            echo 80
            
            # Update GRUB
            if command -v update-grub &> /dev/null; then
                update-grub &> /dev/null
            elif command -v grub-mkconfig &> /dev/null; then
                grub-mkconfig -o /boot/grub/grub.cfg &> /dev/null
            fi
            echo 100
        } | whiptail --gauge "Installing Theme & Updating GRUB..." 6 50 0

        whiptail --title "Success" --msgbox "Theme '$CHOICE' applied successfully!" 8 45
    else
        # User cancelled
        continue
    fi
done
