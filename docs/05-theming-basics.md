# Theming Basics

The `theme.txt` file is the heart of the operation. It uses a specific syntax defined by the GRUB project.

## Basic Syntax

A component is defined like this:
```
+ component_name {
    property = "value"
    another_prop = 123
}
```

## Global Properties
At the top of the file, you set global defaults:
```
title-text: ""                  # Hide the default ugly title
desktop-image: "background.png" # Your wallpaper
desktop-color: "#000000"        # Fallback color
terminal-font: "font.pf2"       # Font for the console
```

## Components

### `image`
Displays a static picture (like a logo).
```
+ image {
    file = "logo.png"
    left = 50%-256   # Math allowed! Centered horizontally
    top = 10%        # 10% from the top
}
```

### `boot_menu`
The list of Operating Systems.
```
+ boot_menu {
    left = 50%-200
    width = 400
    item_height = 30
    item_color = "#cccccc"
    selected_item_color = "#ffffff"
}
```

### `label`
Text on screen (like the countdown).
```
+ label {
    text = "Booting in %d seconds"
    color = "#ff0000"
}
```

## Pro Tip
GRUB's coordinate system starts from the **top-left (0,0)**.
You can use percentages (`50%`) or pixels (`1920`).
Mixed math (`50%-100`) is extremely useful for centering elements.
