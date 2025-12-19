# Changelog

## [1.0.1] - 2025-12-19

### Fixed
- Behebt Installation-Fehler durch Anpassung der Base-Images
- Verbesserte Verzeichnis-Erstellung und Berechtigungen
- Korrekte S6-Service-Implementierung

### Changed
- Document Root auf `/config/www/[subdirectory]` geändert
- Subdirectory-Option hinzugefügt (Standard: "php")
- Verzeichnisse werden jetzt automatisch mit korrekten Berechtigungen erstellt
- Verbesserte Standard-index.php mit besserem Design
- Base-Image auf hassio-addons umgestellt

## [1.0.0] - 2025-12-19

### Added
- Initial release
- PHP 8.3 support
- Configurable web server port
- Configurable document root
- Access to Home Assistant config directory
- Common PHP extensions pre-installed
- Configurable PHP settings (display_errors, memory_limit)
- Automatic creation of default index.php
- Support for multiple architectures (aarch64, amd64, armhf, armv7, i386)
