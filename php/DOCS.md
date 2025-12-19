# Home Assistant Add-on: PHP Web Server

## Installation

Follow these steps to install the PHP Web Server Add-on:

1. Navigate to the Supervisor panel (Add-ons) in your Home Assistant interface.
2. Click on the Add-on Store.
3. Add this repository: `https://github.com/TillitschScHocK/PHP4HA`
4. Find "PHP Web Server" and click **Install**.

## Usage

After installation:

1. Configure the Add-on settings (Port, Subdirectory, etc.).
2. Start the Add-on.
3. Check the logs to ensure it started successfully.
4. Access your PHP web server: `http://homeassistant.local:8099`

## Configuration

The Add-on can be configured with the following options:

### Port (required)

The network port on which the PHP server will listen.

```yaml
port: 8099

```

### Subdirectory (required)

The subdirectory inside `/config/www/` where your PHP files are located.

```yaml
subdirectory: "php"

```

**Important:** The Add-on automatically creates:

* `/config/www/` (if it doesn't exist)
* `/config/www/[subdirectory]/` (if it doesn't exist)
* A default `index.php` (if it doesn't exist)

**Examples:**

* `subdirectory: "php"` → Document Root: `/config/www/php/`
* `subdirectory: "my-app"` → Document Root: `/config/www/my-app/`

### PHP Display Errors (optional)

Controls whether PHP errors are displayed in the browser.

* `On`: Show errors (useful for development)
* `Off`: Hide errors (recommended for production)

```yaml
php_display_errors: "Off"

```

### PHP Memory Limit (optional)

Sets the maximum amount of memory a PHP script is allowed to consume.

```yaml
php_memory_limit: "128M"

```

## Included PHP Extensions

This Add-on includes the following PHP extensions:

* opcache
* mysqli
* json
* openssl
* curl
* zlib
* xml
* phar
* intl
* dom
* xmlreader/xmlwriter
* simplexml
* ctype
* mbstring
* gd
* session
* pdo
* pdo_mysql
* pdo_sqlite
* fileinfo

## Creating Your First PHP Page

1. The Add-on automatically creates `/config/www/[subdirectory]/`.
2. Upon the first start, a default `index.php` is created.
3. You can edit this file or add your own PHP files.

**Example:** Create `/config/www/php/info.php`:

```php
<?php
echo "<h1>Welcome to PHP on Home Assistant!</h1>";
phpinfo();
?>

```

Access: `http://homeassistant.local:8099/info.php`

## Accessing Home Assistant Data

Since the Add-on has access to the `/config` directory, you can read Home Assistant configuration files, access the database, and more.

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

### Example: Listing files in the config directory

```php
<?php
$files = scandir('/config');
echo "<ul>";
foreach($files as $file) {
    if($file != '.' && $file != '..') {
        echo "<li>$file</li>";
    }
}
echo "</ul>";
?>

```

## Troubleshooting

### Add-on does not start

* Check the Add-on logs for error messages.
* Ensure the port is not already in use.
* Verify that there is enough storage space available.

### Cannot access the web server

* Verify that the Add-on is running.
* Check your Home Assistant network configuration.
* Try accessing via the IP address instead of the hostname.
* Ensure the port is not blocked by a firewall.

### PHP errors are not shown

* Set `php_display_errors: "On"` in the configuration.
* Restart the Add-on after changing the configuration.

### Directory is not created

* The Add-on automatically creates `/config/www/[subdirectory]/`.
* Check the logs for permission errors.
* Ensure that `/config` is writable.

## Security Notes

* Use `php_display_errors: "Off"` in production environments.
* Be cautious when exposing this Add-on to the internet.
* Implement proper authentication in your PHP applications.
* Keep your PHP code secure and up to date.
* Avoid storing sensitive data in web-accessible directories.

## Support

For issues, questions, or feature requests:

* GitHub Issues: [https://github.com/TillitschScHocK/PHP4HA/issues](https://github.com/TillitschScHocK/PHP4HA/issues)
