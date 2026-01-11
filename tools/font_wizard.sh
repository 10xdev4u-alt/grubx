#!/bin/bash

# PrinceTheme Font Wizard
# Scans system for TTF fonts and converts them to GRUB PF2 format
# Author: PrinceTheProgrammer

OUTPUT_DIR="../PrinceTheme/fonts"
SIZE=24

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}PrinceTheme Font Wizard 🧙${NC}"

if ! command -v grub-mkfont &> /dev/null; then
    echo -e "${RED}Error: 'grub-mkfont' command not found.${NC}"
    echo "Please install 'grub2-common' or 'grub-tools'."
    exit 1
fi

# Common font locations
FONT_DIRS=(
    "/usr/share/fonts/truetype"
    "/usr/share/fonts/TTF"
    "~/.local/share/fonts"
)

# List of fonts we want to try and find
WANTED_FONTS=(
    "Hack-Regular.ttf"
    "FiraCode-Regular.ttf"
    "Roboto-Regular.ttf"
    "UbuntuMono-R.ttf"
    "DejaVuSansMono.ttf"
)

mkdir -p "$OUTPUT_DIR"

for font_name in "${WANTED_FONTS[@]}"; do
    echo "Looking for $font_name..."
    found=0
    
    # Deep search
    file_path=$(find /usr/share/fonts -name "$font_name" 2>/dev/null | head -n 1)
    
    if [ ! -z "$file_path" ]; then
        echo -e "Found: $file_path"
        dest_name=$(basename "$font_name" .ttf).pf2
        
        echo "Converting to $dest_name ($SIZE px)..."
        grub-mkfont -s "$SIZE" -o "$OUTPUT_DIR/$dest_name" "$file_path"
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Success!${NC}"
        else
            echo -e "${RED}Conversion failed.${NC}"
        fi
    else
        echo "Not found."
    fi
done

echo "Done. Check $OUTPUT_DIR for new fonts."
