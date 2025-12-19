# Home Assistant Add-on: PHP Web Server

## About

This add-on provides a PHP web server with direct access to your Home Assistant configuration directory. Perfect for custom PHP applications, dashboards, or tools that need to integrate with Home Assistant.

## Features

* 🚀 PHP 8.3 with common extensions
* 📁 Direct access to the `/config` directory
* ⚙️ Configurable subdirectory
* 🔧 Customizable PHP settings
* 🌐 Web-based access to your PHP applications

## Installation

1. Add this repository to your Home Assistant Add-on Store:
* Go to **Settings** → **Add-ons** → **Add-on Store** → **⋮** (top right) → **Repositories**
* Add: `https://github.com/TillitschScHocK/PHP4HA`


2. Find "PHP Web Server" in the Add-on Store and click **Install**.
3. Configure the add-on (see Configuration below).
4. Start the add-on.

## Configuration

Example configuration:

```yaml
port: 8099
subdirectory: "php"
php_display_errors: "Off"
php_memory_limit: "128M"

```

### Option: `port`

The port on which the PHP web server listens.

### Option: `subdirectory`

The subfolder in `/config/www/` for your PHP files.
Your Document Root will be: `/config/www/[subdirectory]`

Example: With `subdirectory: "php"`, the directory `/config/www/php` is used.

### Option: `php_display_errors`

Whether PHP errors should be displayed. Use "On" for development, "Off" for production.

### Option: `php_memory_limit`

PHP memory limit. Default is "128M".

## Usage

1. The add-on automatically creates the directory `/config/www/[subdirectory]`.
2. Place your PHP files in this directory.
3. Access your PHP application: `http://homeassistant.local:8099`

### Example PHP File

Create `/config/www/php/test.php`:

```php
<?php
echo "<h1>Hello from Home Assistant!</h1>";
echo "<p>Server time: " . date('Y-m-d H:i:s') . "</p>";
?>

```

Access: `http://homeassistant.local:8099/test.php`

## Support

For issues and feature requests, please visit:
[https://github.com/TillitschScHocK/PHP4HA/issues](https://github.com/TillitschScHocK/PHP4HA/issues)

## License

MIT License - see LICENSE file for details
