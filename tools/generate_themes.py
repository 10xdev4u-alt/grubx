import os

# Template for the theme
TEMPLATE = """# Generated Theme: {name}
# Palette: {palette_name}

title-text: ""
desktop-image: "background.png" 
desktop-image-scale-method: "stretch"
desktop-color: "{bg_color}"
terminal-font: "font.pf2"
terminal-left: "0"
terminal-top: "0"
terminal-width: "100%"
terminal-height: "100%"

+ boot_menu {{
    left = 50%-250
    top = 50%-100
    width = 500
    height = 50%
    item_font = "font.pf2"
    item_color = "{fg_color}"
    selected_item_color = "{sel_color}"
    icon_width = 32
    icon_height = 32
    item_icon_space = 20
    item_height = 40
    item_padding = 5
    item_spacing = 10
    selected_item_pixmap_style = "select_*.png"
}}

+ label {{
    top = 90%
    left = 0
    width = 100%
    align = "center"
    id = "__timeout__"
    text = "Booting {name} configuration in %d seconds..."
    font = "font.pf2"
    color = "{fg_color}"
}}
"""

# 100 Creative Palettes
THEMES = [
    # Classic Colors
    ("Red", "#000000", "#FFaaaa", "#FF0000"),
    ("Blue", "#000000", "#aaaaff", "#0000FF"),
    ("Green", "#000000", "#aaffaa", "#00FF00"),
    ("Yellow", "#000000", "#ffffaa", "#FFFF00"),
    ("Purple", "#000000", "#ffaaff", "#FF00FF"),
    ("Cyan", "#000000", "#aaffff", "#00FFFF"),
    ("Orange", "#000000", "#ffccaa", "#FF8800"),
    ("Pink", "#000000", "#ffccff", "#FF88AA"),
    ("Teal", "#000000", "#aaffcc", "#00FF88"),
    ("Lime", "#000000", "#ccffaa", "#88FF00"),
    
    # Famous Color Schemes
    ("Dracula", "#282a36", "#f8f8f2", "#bd93f9"),
    ("Nord", "#2e3440", "#d8dee9", "#88c0d0"),
    ("Gruvbox", "#282828", "#ebdbb2", "#fabd2f"),
    ("SolarizedDark", "#002b36", "#839496", "#b58900"),
    ("SolarizedLight", "#fdf6e3", "#657b83", "#2aa198"),
    ("Monokai", "#272822", "#f8f8f2", "#a6e22e"),
    ("OneDark", "#282c34", "#abb2bf", "#61afef"),
    ("TokyoNight", "#1a1b26", "#a9b1d6", "#7aa2f7"),
    ("CatppuccinMocha", "#1e1e2e", "#cdd6f4", "#f5c2e7"),
    ("CatppuccinLatte", "#eff1f5", "#4c4f69", "#ea76cb"),
    
    # Nature Inspired
    ("Forest", "#1a2f1a", "#aaffaa", "#228b22"),
    ("Ocean", "#001f3f", "#7fdbff", "#0074d9"),
    ("Desert", "#3d2b1f", "#edc9af", "#d2691e"),
    ("Sunset", "#2d1b2e", "#ffcc00", "#ff4500"),
    ("Arctic", "#f0f8ff", "#2f4f4f", "#00ced1"),
    ("Volcano", "#2b1b17", "#ff4500", "#ff0000"),
    ("Lavender", "#e6e6fa", "#4b0082", "#9370db"),
    ("Mint", "#f5fffa", "#2e8b57", "#00fa9a"),
    ("CherryBlossom", "#fff0f5", "#ff69b4", "#ff1493"),
    ("Midnight", "#191970", "#f8f8ff", "#4169e1"),

    # Tech & Cyber
    ("Matrix", "#000000", "#003300", "#00ff00"),
    ("Terminal", "#000000", "#cccccc", "#00ff00"),
    ("CyberYellow", "#050505", "#aaaa00", "#ffff00"),
    ("NeonBlue", "#000011", "#0088ff", "#00ffff"),
    ("Hacker", "#0d0d0d", "#33ff00", "#ccff00"),
    ("Ubuntu", "#300a24", "#ffffff", "#e95420"),
    ("Arch", "#1793d1", "#eeeeee", "#ffffff"),
    ("Manjaro", "#263238", "#ffffff", "#35bf5c"),
    ("Fedora", "#294172", "#ffffff", "#3c6eb4"),
    ("Debian", "#a80030", "#ffffff", "#d70a53"),

    # Elements
    ("Fire", "#330000", "#ffcc00", "#ff4400"),
    ("Water", "#000033", "#aaaaff", "#4444ff"),
    ("Earth", "#1a1a00", "#886600", "#aa8800"),
    ("Air", "#ccffff", "#444444", "#8888ff"),
    ("Metal", "#222222", "#aaaaaa", "#ffffff"),
    
    # Fun
    ("Candy", "#ff0066", "#ffff00", "#00ffff"),
    ("Coffee", "#6f4e37", "#f5f5dc", "#d2691e"),
    ("DarkChocolate", "#3e2723", "#d7ccc8", "#8d6e63"),
    ("Gold", "#332200", "#ffdd00", "#cca300"),
    ("Silver", "#2c3e50", "#ecf0f1", "#bdc3c7"),
    ("Bronze", "#3e2723", "#ffe0b2", "#d84315"),
    
    # ... and many more variations
]

# Generate variations to reach 100
base_themes = list(THEMES)
count = len(THEMES)
for i in range(count, 100):
    # Procedural generation for the rest
    name = f"Variant{i+1}"
    bg = f"#{i:02x}{i:02x}{i:02x}" # Shades of grey
    fg = "#ffffff"
    sel = "#ff0000"
    THEMES.append((name, bg, fg, sel))

OUTPUT_DIR = "../PrinceTheme/variants"

def main():
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)
        
    print(f"Generating {len(THEMES)} themes into {OUTPUT_DIR}...")
    
    for name, bg, fg, sel in THEMES:
        filename = f"theme_{name.lower()}.txt"
        filepath = os.path.join(OUTPUT_DIR, filename)
        
        content = TEMPLATE.format(
            name=name,
            palette_name=name,
            bg_color=bg,
            fg_color=fg,
            sel_color=sel
        )
        
        with open(filepath, "w") as f:
            f.write(content)
            
    print("Done! 100 Themes Generated. Ready to serve.")

if __name__ == "__main__":
    main()
