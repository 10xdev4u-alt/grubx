#!/usr/bin/env python3
import os
import sys

# Configuration
VARIANTS_DIR = "../PrinceTheme/variants"
ASSETS_DIR = "../PrinceTheme"
REQUIRED_PROPERTIES = [
    "desktop-image",
    "terminal-font",
    "boot_menu",
    "item_color",
    "selected_item_color"
]

def validate_theme(filepath):
    issues = []
    content = ""
    try:
        with open(filepath, "r") as f:
            content = f.read()
    except Exception as e:
        return [f"Could not read file: {e}"]

    # Check for critical properties
    for prop in REQUIRED_PROPERTIES:
        if prop not in content:
            issues.append(f"Missing property: {prop}")

    # Check for curly brace balance (simple check)
    open_braces = content.count("{")
    close_braces = content.count("}")
    if open_braces != close_braces:
        issues.append(f"Mismatched braces: {{={open_braces}, }}={close_braces}")

    return issues

def main():
    if not os.path.exists(VARIANTS_DIR):
        print(f"Error: Directory {VARIANTS_DIR} not found.")
        sys.exit(1)

    print(f"🔍 Starting Validation on {VARIANTS_DIR}...")
    
    files = [f for f in os.listdir(VARIANTS_DIR) if f.endswith(".txt")]
    files.sort()
    
    error_count = 0
    passed_count = 0

    for filename in files:
        filepath = os.path.join(VARIANTS_DIR, filename)
        issues = validate_theme(filepath)
        
        if issues:
            print(f"❌ {filename}: FAILED")
            for issue in issues:
                print(f"   - {issue}")
            error_count += 1
        else:
            # print(f"✅ {filename}: OK") # Too verbose for 100 files
            passed_count += 1

    print("\n" + "="*30)
    print(f"Summary:")
    print(f"✅ Passed: {passed_count}")
    print(f"❌ Failed: {error_count}")
    print("="*30)

    if error_count > 0:
        sys.exit(1)
    else:
        print("All themes are Enterprise Ready! 🚀")
        sys.exit(0)

if __name__ == "__main__":
    main()
