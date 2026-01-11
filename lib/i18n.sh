#!/bin/bash

# i18n Library for PrinceTheme
# Loads the appropriate language file

# Default to English
LANG_FILE="locales/en.sh"

# Check system language or override
# You can set PRINCE_LANG=ta in your environment to override
if [ ! -z "$PRINCE_LANG" ] && [ -f "locales/$PRINCE_LANG.sh" ]; then
    LANG_FILE="locales/$PRINCE_LANG.sh"
fi

# Load the strings
if [ -f "$LANG_FILE" ]; then
    source "$LANG_FILE"
else
    # Fallback if path is different (e.g., installed system-wide)
    if [ -f "/boot/grub/themes/PrinceTheme/locales/en.sh" ]; then
        source "/boot/grub/themes/PrinceTheme/locales/en.sh"
    else
        echo "Warning: Localization file not found. Falling back to hardcoded English."
        MSG_ROOT_REQUIRED="Please run as root."
        MSG_COMPLETE="Done."
    fi
fi
