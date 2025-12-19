# Home Assistant Add-on: PHP Web Server

## Installation

Follow these steps to install the PHP Web Server add-on:

1. Navigate to the Supervisor panel in your Home Assistant interface
2. Click on the Add-on Store
3. Add this repository: `https://github.com/TillitschScHocK/PHP4HA`
4. Find "PHP Web Server" and click Install

## How to use

After installation:

1. Configure the add-on settings (port, document root, etc.)
2. Start the add-on
3. Check the logs to ensure it started successfully
4. Access your PHP web server at `http://homeassistant.local:8099` (or your configured port)

## Configuration

The add-on can be configured with the following options:

### Port (required)

The network port the PHP server will listen on.

```yaml
port: 8099
```

### Document Root (required)

The directory where your PHP files are located. This should be a path within the Home Assistant `/config` directory.

```yaml
document_root: "/config/www"
```

### PHP Display Errors (optional)

Controls whether PHP errors are displayed in the browser.

- `On`: Show errors (useful for development)
- `Off`: Hide errors (recommended for production)

```yaml
php_display_errors: "Off"
```

### PHP Memory Limit (optional)

Sets the maximum amount of memory a PHP script may consume.

```yaml
php_memory_limit: "128M"
```

## PHP Extensions Included

This add-on includes the following PHP extensions:

- opcache
- mysqli
- json
- openssl
- curl
- zlib
- xml
- phar
- intl
- dom
- xmlreader/xmlwriter
- simplexml
- ctype
- mbstring
- gd
- session
- pdo
- pdo_mysql
- pdo_sqlite

## Creating Your First PHP Page

1. Using the File Editor add-on or SSH, create a directory `/config/www` if it doesn't exist
2. Create a file `/config/www/index.php` with the following content:

```php
<?php
echo "<h1>Welcome to PHP on Home Assistant!</h1>";
phpinfo();
?>
```

3. Start the PHP Web Server add-on
4. Open your browser and navigate to `http://homeassistant.local:8099`

## Accessing Home Assistant Data

Since the add-on has access to the `/config` directory, you can read Home Assistant configuration files, access the database, and more.

### Example: Reading a YAML file

```php
<?php
$yaml_file = '/config/configuration.yaml';
if (file_exists($yaml_file)) {
    $content = file_get_contents($yaml_file);
    echo "<pre>" . htmlspecialchars($content) . "</pre>";
}
?>
```

## Troubleshooting

### Add-on won't start

- Check the add-on logs for error messages
- Verify the document root path exists
- Ensure the port is not already in use

### Cannot access the web server

- Verify the add-on is running
- Check your Home Assistant network configuration
- Try accessing via IP address instead of hostname
- Ensure the port is not blocked by a firewall

### PHP errors not showing

- Set `php_display_errors: "On"` in the configuration
- Restart the add-on after changing configuration

## Security Considerations

- Use `php_display_errors: "Off"` in production environments
- Be cautious when exposing this add-on to the internet
- Implement proper authentication in your PHP applications
- Keep your PHP code secure and updated
- Avoid storing sensitive data in web-accessible directories

## Support

For issues, questions, or feature requests:
- GitHub Issues: https://github.com/TillitschScHocK/PHP4HA/issues
