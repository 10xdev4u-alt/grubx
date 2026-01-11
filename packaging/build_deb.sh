#!/bin/bash
# Build .deb package

mkdir -p build/princetheme/DEBIAN
mkdir -p build/princetheme/boot/grub/themes/PrinceTheme
mkdir -p build/princetheme/usr/local/bin

# Copy Control file
cp packaging/control build/princetheme/DEBIAN/

# Copy Theme Files
cp -r PrinceTheme/* build/princetheme/boot/grub/themes/PrinceTheme/

# Copy Scripts (as system commands)
cp theme_store.sh build/princetheme/usr/local/bin/princetheme-store
cp switch_theme.sh build/princetheme/usr/local/bin/princetheme-switch

# Set Permissions
chmod 755 build/princetheme/DEBIAN/control
chmod 755 build/princetheme/usr/local/bin/*

# Build
dpkg-deb --build build/princetheme

mv build/princetheme.deb princetheme_1.0.0_all.deb
echo "Package built: princetheme_1.0.0_all.deb"

# Clean up
rm -rf build
