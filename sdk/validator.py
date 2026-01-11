import os

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

def validate_directory(directory):
    results = {"passed": 0, "failed": 0, "details": {}}
    
    if not os.path.exists(directory):
        raise FileNotFoundError(f"Directory {directory} not found")

    files = [f for f in os.listdir(directory) if f.endswith(".txt")]
    files.sort()

    for filename in files:
        filepath = os.path.join(directory, filename)
        issues = validate_theme(filepath)
        
        if issues:
            results["failed"] += 1
            results["details"][filename] = issues
        else:
            results["passed"] += 1
            
    return results
