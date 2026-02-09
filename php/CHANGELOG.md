# Changelog

## [1.0.2] - 2026-02-09

### Changed
- Standardport von 8099 auf 8080 geändert.

## [1.0.1] - 2025-12-20

### Fixed
- Fixed installation issues by adjusting the base images.  
- Improved directory creation and permissions.  
- Correct S6 service implementation.  

### Changed
- Changed the document root to `/config/www/[subdirectory]`.  
- Added subdirectory option (default: "php").  
- Directories are now created automatically with correct permissions.  
- Improved default `index.php` with a better design.  
- Switched base image to `hassio-addons`.  

## [1.0.0] - 2025-12-19

### Added
- Initial release.  
- PHP 8.3 support.  
- Configurable web server port.  
- Configurable document root.  
- Access to the Home Assistant config directory.  
- Common PHP extensions pre-installed.  
- Configurable PHP settings (`display_errors`, `memory_limit`).  
- Automatic creation of a default `index.php`.  
- Support for multiple architectures (aarch64, amd64, armhf, armv7, i386).  
