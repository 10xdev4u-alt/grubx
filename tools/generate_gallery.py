import os
import re

VARIANTS_DIR = "../PrinceTheme/variants"
OUTPUT_FILE = "../docs/gallery.html"

HTML_TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrinceTheme Gallery</title>
    <style>
        body {{ font-family: 'Segoe UI', sans-serif; background: #111; color: #fff; padding: 20px; }}
        h1 {{ text-align: center; color: #89B4FA; }}
        .grid {{ display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; }}
        .card {{ background: #222; border-radius: 10px; overflow: hidden; transition: transform 0.2s; border: 1px solid #333; }}
        .card:hover {{ transform: translateY(-5px); border-color: #89B4FA; }}
        .preview {{ height: 180px; position: relative; background-size: cover; background-position: center; }}
        .menu-box {{
            position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);
            width: 60%; height: 60%; border: 1px solid rgba(255,255,255,0.2);
            padding: 10px; box-sizing: border-box;
            display: flex; flex-direction: column; justify-content: center;
        }}
        .menu-item {{ height: 10px; margin-bottom: 5px; opacity: 0.7; border-radius: 2px; }}
        .menu-item.selected {{ opacity: 1; }}
        .info {{ padding: 15px; }}
        .title {{ font-weight: bold; margin-bottom: 5px; display: block; }}
        .code {{ font-family: monospace; font-size: 0.8em; color: #888; }}
        .swatch {{ display: inline-block; width: 12px; height: 12px; border-radius: 50%; margin-right: 5px; }}
    </style>
</head>
<body>
    <h1>🎨 PrinceTheme Gallery ({count} Variants)</h1>
    <div class="grid">
        {cards}
    </div>
</body>
</html>
"""

CARD_TEMPLATE = """
<div class="card">
    <div class="preview" style="background-color: {desktop_color};">
        <div class="menu-box" style="border-color: {item_color};">
            <div class="menu-item" style="background-color: {item_color}; width: 60%;"></div>
            <div class="menu-item selected" style="background-color: {selected_item_color}; width: 80%;"></div>
            <div class="menu-item" style="background-color: {item_color}; width: 50%;"></div>
        </div>
    </div>
    <div class="info">
        <span class="title">{name}</span>
        <div class="code">
            <span class="swatch" style="background: {desktop_color}"></span>BG
            <span class="swatch" style="background: {item_color}"></span>FG
            <span class="swatch" style="background: {selected_item_color}"></span>SEL
        </div>
    </div>
</div>
"""

def parse_theme(filepath):
    props = {
        "desktop-color": "#000000",
        "item_color": "#cccccc",
        "selected_item_color": "#ffffff"
    }
    with open(filepath, "r") as f:
        for line in f:
            if "desktop-color" in line:
                props["desktop-color"] = line.split('"')[1]
            if "item_color =" in line:
                props["item_color"] = line.split('"')[1]
            if "selected_item_color =" in line:
                props["selected_item_color"] = line.split('"')[1]
    return props

def main():
    cards_html = ""
    files = sorted([f for f in os.listdir(VARIANTS_DIR) if f.endswith(".txt")])
    
    for filename in files:
        name = filename.replace("theme_", "").replace(".txt", "").title()
        props = parse_theme(os.path.join(VARIANTS_DIR, filename))
        
        cards_html += CARD_TEMPLATE.format(
            name=name,
            desktop_color=props["desktop-color"],
            item_color=props["item_color"],
            selected_item_color=props["selected_item_color"]
        )
        
    final_html = HTML_TEMPLATE.format(count=len(files), cards=cards_html)
    
    with open(OUTPUT_FILE, "w") as f:
        f.write(final_html)
    
    print(f"Generated gallery for {len(files)} themes at {OUTPUT_FILE}")

if __name__ == "__main__":
    main()
