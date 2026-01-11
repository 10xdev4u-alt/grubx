import os

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

THEMES = [
    ("Red", "#000000", "#FFaaaa", "#FF0000"),
    ("Blue", "#000000", "#aaaaff", "#0000FF"),
    ("Green", "#000000", "#aaffaa", "#00FF00"),
    ("Yellow", "#000000", "#ffffaa", "#FFFF00"),
    ("Purple", "#000000", "#ffaaff", "#FF00FF"),
    ("Cyan", "#000000", "#aaffff", "#00FFFF"),
    ("Orange", "#000000", "#ffccaa", "#FF8800"),
    ("Dracula", "#282a36", "#f8f8f2", "#bd93f9"),
    ("Nord", "#2e3440", "#d8dee9", "#88c0d0"),
    ("Gruvbox", "#282828", "#ebdbb2", "#fabd2f"),
    # (Simplified list for SDK version, but in reality we'd have all 100)
]

# Add procedural generation back if needed
for i in range(len(THEMES), 100):
    name = f"Variant{i+1}"
    bg = f"#{i:02x}{i:02x}{i:02x}"
    THEMES.append((name, bg, "#ffffff", "#ff0000"))

def generate_themes(output_dir):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
        
    generated_count = 0
    for name, bg, fg, sel in THEMES:
        filename = f"theme_{name.lower()}.txt"
        filepath = os.path.join(output_dir, filename)
        
        content = TEMPLATE.format(
            name=name,
            palette_name=name,
            bg_color=bg,
            fg_color=fg,
            sel_color=sel
        )
        
        with open(filepath, "w") as f:
            f.write(content)
        generated_count += 1
            
    return generated_count
