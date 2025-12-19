# PHP4HA - PHP Web Server for Home Assistant

A complete PHP web server as a Home Assistant Add-on with direct access to your Home Assistant configuration directory.

## Features

* 🚀 **PHP 8.3** with all common extensions
* 📁 **Direct access** to the `/config` directory
* ⚙️ **Configurable** (Port, Subdirectory, PHP settings)
* 🌐 **Easy access** via browser
* 🔧 **Multi-architecture** support (amd64, aarch64, armv7, armhf, i386)
* 🛡️ **Automatic directory creation** with correct permissions

## Installation

### Step 1: Add Repository

1. Open Home Assistant.
2. Go to **Settings** → **Add-ons** → **Add-on Store**.
3. Click on the three dots **⋮** in the top right corner.
4. Select **Repositories**.
5. Add this URL:
```
https://github.com/TillitschScHocK/PHP4HA

```


6. Click **Add**.

### Step 2: Install Add-on

1. Search for "PHP Web Server" in the Add-on Store.
2. Click **Install**.
3. Wait for the installation to finish.

### Step 3: Configuration

Example configuration:

```yaml
port: 8099
subdirectory: "php"
php_display_errors: "Off"
php_memory_limit: "128M"

```

**Important:** The `subdirectory` parameter determines the folder inside `/config/www/`:

* With `subdirectory: "php"`, `/config/www/php/` is used as the Document Root.
* With `subdirectory: "my-app"`, `/config/www/my-app/` is used.

The Add-on automatically creates:

1. `/config/www/` (if it doesn't exist)
2. `/config/www/[subdirectory]/` (if it doesn't exist)
3. A default `index.php` (if it doesn't exist)

### Step 4: Start

1. Click **Start**.
2. Enable "Show in sidebar" (optional).
3. Check the logs to ensure everything started correctly.

## Usage

### Creating your first PHP file

Upon the first start, the Add-on automatically creates:

* The directory `/config/www/[subdirectory]/`
* An example `index.php`

You can then:

1. Create your own PHP files in `/config/www/[subdirectory]/`.
2. Open them in your browser: `http://homeassistant.local:8099`.

**Example:** Create `/config/www/php/test.php`:

```php
<?php
echo "<h1>Hello from Home Assistant!</h1>";
echo "<p>Server Time: " . date('Y-m-d H:i:s') . "</p>";
?>

```

Access: `http://homeassistant.local:8099/test.php`

### Accessing Home Assistant Data

The Add-on has full read/write access to `/config`:

```php
<?php
// Example: Read a YAML file
$config = file_get_contents('/config/configuration.yaml');
echo "<pre>" . htmlspecialchars($config) . "</pre>";
?>

```

## Configuration Options

| Option | Type | Default | Description |
| --- | --- | --- | --- |
| `port` | Port | 8099 | Web server port |
| `subdirectory` | String | php | Subfolder inside /config/www/ |
| `php_display_errors` | List | Off | Show errors (On/Off) |
| `php_memory_limit` | String | 128M | PHP memory limit |

## Included PHP Extensions

* opcache, mysqli, json
* openssl, curl, zlib
* xml, phar, intl
* dom, xmlreader, xmlwriter
* simplexml, ctype, mbstring
* gd, session, fileinfo
* pdo, pdo_mysql, pdo_sqlite

## Example Projects

### Dashboard with Home Assistant API

```php
<?php
// Read API Token from Supervisor Environment
$token = getenv('SUPERVISOR_TOKEN');

// Call Home Assistant API
$ch = curl_init('http://supervisor/core/api/states');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Authorization: Bearer ' . $token,
    'Content-Type: application/json'
]);

$response = curl_exec($ch);
$states = json_decode($response, true);
curl_close($ch);

// Display Data
foreach ($states as $state) {
    echo $state['entity_id'] . ": " . $state['state'] . "<br>";
}
?>

```

## Troubleshooting

### Add-on does not start

* Check the logs in the Add-on tab.
* Ensure the port is not already in use.
* Check if there is enough storage space available.

### Cannot access the server

* Verify the Add-on is running.
* Try accessing via IP address: `http://192.168.x.x:8099`.
* Check your firewall settings.

### PHP errors are not shown

* Set `php_display_errors: "On"` in the configuration.
* Restart the Add-on.
* Check the Add-on logs for specific error messages.

### Installation fails

* Check the Supervisor logs: `ha supervisor logs`.
* Ensure you are using the latest version of Home Assistant.
* Try a different base image (automatically selected for your architecture, but occasionally issues arise).

## Security Notes

* Use `php_display_errors: "Off"` in production environments.
* Be cautious when exposing this Add-on to the internet.
* Implement authentication in your PHP applications if needed.
* Do not store sensitive data (passwords, tokens) in publicly accessible directories inside `/www/`.

## Support

For issues or questions:

* GitHub Issues: [https://github.com/TillitschScHocK/PHP4HA/issues](https://github.com/TillitschScHocK/PHP4HA/issues)

## License

MIT License - see the [LICENSE](https://www.google.com/search?q=LICENSE) file for details.

## Changelog

See [CHANGELOG.md](https://www.google.com/search?q=php/CHANGELOG.md) for full change history.
