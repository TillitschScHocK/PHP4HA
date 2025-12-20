# Changelog

## [1.0.1] - 2025-12-20

### Fixed
- Fixed installation issues by adjusting the base images [web:1].  
- Improved directory creation and permissions [web:1].  
- Correct S6 service implementation [web:1].  

### Changed
- Changed the document root to `/config/www/[subdirectory]` [web:1].  
- Added subdirectory option (default: "php") [web:1].  
- Directories are now created automatically with correct permissions [web:1].  
- Improved default `index.php` with a better design [web:1].  
- Switched base image to `hassio-addons` [web:1].  

## [1.0.0] - 2025-12-19

### Added
- Initial release [web:1].  
- PHP 8.3 support [web:1].  
- Configurable web server port [web:1].  
- Configurable document root [web:1].  
- Access to the Home Assistant config directory [web:1].  
- Common PHP extensions pre-installed [web:1].  
- Configurable PHP settings (`display_errors`, `memory_limit`) [web:1].  
- Automatic creation of a default `index.php` [web:1].  
- Support for multiple architectures (aarch64, amd64, armhf, armv7, i386) [web:1].  
