# Home Assistant Add-on: PHP Web Server

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)

## About

This add-on provides a PHP web server with direct access to your Home Assistant configuration directory. Perfect for hosting custom PHP applications, dashboards, or tools that integrate with Home Assistant.

## Features

- 🚀 PHP 8.3 with common extensions
- 📁 Direct access to `/config` directory
- ⚙️ Configurable document root
- 🔧 Customizable PHP settings
- 🌐 Web-based access to your PHP applications

## Installation

1. Add this repository to your Home Assistant add-on store:
   - Go to **Supervisor** → **Add-on Store** → **⋮** (top right) → **Repositories**
   - Add: `https://github.com/TillitschScHocK/PHP4HA`

2. Find "PHP Web Server" in the add-on store and click **Install**

3. Configure the add-on (see Configuration section below)

4. Start the add-on

## Configuration

Example configuration:

```yaml
port: 8099
document_root: "/config/www"
php_display_errors: "Off"
php_memory_limit: "128M"
```

### Option: `port`

The port on which the PHP web server will listen.

### Option: `document_root`

The root directory for your PHP files. Default is `/config/www`.

### Option: `php_display_errors`

Whether to display PHP errors. Use "On" for development, "Off" for production.

### Option: `php_memory_limit`

PHP memory limit. Default is "128M".

## Usage

1. Place your PHP files in the configured document root (default: `/config/www`)
2. Access your PHP application at: `http://homeassistant.local:8099`

### Example PHP File

Create `/config/www/index.php`:

```php
<?php
echo "<h1>Hello from Home Assistant!</h1>";
echo "<p>Server time: " . date('Y-m-d H:i:s') . "</p>";
?>
```

## Support

For issues and feature requests, please visit:
https://github.com/TillitschScHocK/PHP4HA/issues

## License

MIT License - see LICENSE file for details
