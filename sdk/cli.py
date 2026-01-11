import sys
import argparse
from .validator import validate_directory
from .generator import generate_themes
from .gallery import generate_gallery

def main():
    parser = argparse.ArgumentParser(description="PrinceTheme SDK CLI")
    subparsers = parser.add_subparsers(dest="command", help="Command to run")

    # check
    check_parser = subparsers.add_parser("check", help="Validate themes")
    check_parser.add_argument("--dir", default="../PrinceTheme/variants", help="Directory to check")

    # build
    build_parser = subparsers.add_parser("build", help="Generate theme variants")
    build_parser.add_argument("--out", default="../PrinceTheme/variants", help="Output directory")

    # gallery
    gallery_parser = subparsers.add_parser("gallery", help="Generate HTML gallery")
    gallery_parser.add_argument("--dir", default="../PrinceTheme/variants", help="Variants directory")
    gallery_parser.add_argument("--out", default="../docs/gallery.html", help="Output HTML file")

    args = parser.parse_args()

    if args.command == "check":
        print(f"Checking themes in {args.dir}...")
        try:
            results = validate_directory(args.dir)
            print(f"Passed: {results['passed']}")
            print(f"Failed: {results['failed']}")
            if results['failed'] > 0:
                print("Details:", results['details'])
                sys.exit(1)
        except Exception as e:
            print(f"Error: {e}")
            sys.exit(1)

    elif args.command == "build":
        print(f"Generating themes into {args.out}...")
        count = generate_themes(args.out)
        print(f"Generated {count} themes.")

    elif args.command == "gallery":
        print(f"Generating gallery from {args.dir} to {args.out}...")
        count = generate_gallery(args.dir, args.out)
        print(f"Gallery created with {count} items.")

    else:
        parser.print_help()

if __name__ == "__main__":
    main()
