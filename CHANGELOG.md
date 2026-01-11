# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-01-12

### Added
- **i18n Support**: English, Tamil, Spanish support added to all scripts.
- **SDK**: `princetheme` Python SDK with `check`, `build`, `gallery` commands.
- **Fonts**: Font Wizard (`tools/font_wizard.sh`) and Font Switcher.
- **Themes**: 100+ Procedurally generated theme variants.
- **Store**: `theme_store.sh` TUI for browsing themes.
- **DevOps**: `Dockerfile`, `Makefile`, `Vagrantfile`.
- **Docs**: Man page, HTML Gallery, Comprehensive README.

### Changed
- Refactored `install.sh` to use modular libraries.
- Moved all assets to `PrinceTheme/` directory.

### Fixed
- Fixed layout alignment for 4K resolutions (via percentage positioning).
