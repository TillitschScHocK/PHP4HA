# PHP4HA - PHP Web Server for Home Assistant

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![PHP](https://img.shields.io/badge/PHP-8.3-purple.svg)
![Home Assistant](https://img.shields.io/badge/Home%20Assistant-Add--on-blue.svg)

Ein vollständiger PHP-Webserver als Home Assistant Add-on mit direktem Zugriff auf dein Home Assistant Konfigurationsverzeichnis.

## Features

- 🚀 **PHP 8.3** mit allen gängigen Extensions
- 📁 **Direkter Zugriff** auf `/config` Verzeichnis
- ⚙️ **Konfigurierbar** (Port, Document Root, PHP-Einstellungen)
- 🌐 **Einfacher Zugriff** über Browser
- 🔧 **Mehrere Architekturen** unterstützt (amd64, aarch64, armv7, armhf, i386)

## Installation

### Schritt 1: Repository hinzufügen

1. Öffne Home Assistant
2. Gehe zu **Einstellungen** → **Add-ons** → **Add-on Store**
3. Klicke auf die drei Punkte **⋮** oben rechts
4. Wähle **Repositories**
5. Füge diese URL hinzu:
   ```
   https://github.com/TillitschScHocK/PHP4HA
   ```
6. Klicke auf **Hinzufügen**

### Schritt 2: Add-on installieren

1. Suche nach "PHP Web Server" im Add-on Store
2. Klicke auf **Installieren**
3. Warte bis die Installation abgeschlossen ist

### Schritt 3: Konfigurieren

Beispiel-Konfiguration:

```yaml
port: 8099
document_root: "/config/www"
php_display_errors: "Off"
php_memory_limit: "128M"
```

### Schritt 4: Starten

1. Klicke auf **Start**
2. Aktiviere "Im Sidebar anzeigen" (optional)
3. Überprüfe die Logs

## Verwendung

### Erste PHP-Datei erstellen

1. Erstelle das Verzeichnis `/config/www` (falls nicht vorhanden)
2. Erstelle eine Datei `/config/www/index.php`:

```php
<?php
echo "<h1>Hallo von Home Assistant!</h1>";
echo "<p>Server-Zeit: " . date('d.m.Y H:i:s') . "</p>";
?>
```

3. Öffne im Browser: `http://homeassistant.local:8099`

### Zugriff auf Home Assistant Daten

Das Add-on hat vollen Zugriff auf `/config`:

```php
<?php
// Beispiel: YAML-Datei lesen
$config = file_get_contents('/config/configuration.yaml');
echo "<pre>" . htmlspecialchars($config) . "</pre>";
?>
```

## Konfigurationsoptionen

| Option | Typ | Standard | Beschreibung |
|--------|-----|----------|-------------|
| `port` | Port | 8099 | Webserver-Port |
| `document_root` | String | /config/www | Wurzelverzeichnis für PHP-Dateien |
| `php_display_errors` | Liste | Off | Fehleranzeige (On/Off) |
| `php_memory_limit` | String | 128M | PHP-Speicherlimit |

## Enthaltene PHP-Extensions

- opcache, mysqli, json
- openssl, curl, zlib
- xml, phar, intl
- dom, xmlreader, xmlwriter
- simplexml, ctype, mbstring
- gd, session
- pdo, pdo_mysql, pdo_sqlite

## Beispielprojekte

### Dashboard mit Home Assistant API

```php
<?php
// API-Token aus Secrets lesen
$token = getenv('SUPERVISOR_TOKEN');

// Home Assistant API aufrufen
$ch = curl_init('http://supervisor/core/api/states');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Authorization: Bearer ' . $token,
    'Content-Type: application/json'
]);

$response = curl_exec($ch);
$states = json_decode($response, true);
curl_close($ch);

// Daten anzeigen
foreach ($states as $state) {
    echo $state['entity_id'] . ": " . $state['state'] . "<br>";
}
?>
```

## Troubleshooting

### Add-on startet nicht

- Prüfe die Logs
- Stelle sicher, dass der Port nicht bereits verwendet wird
- Überprüfe, ob das Document Root existiert

### Kann nicht auf den Server zugreifen

- Prüfe, ob das Add-on läuft
- Versuche den Zugriff über die IP-Adresse
- Überprüfe Firewall-Einstellungen

### PHP-Fehler werden nicht angezeigt

- Setze `php_display_errors: "On"` in der Konfiguration
- Starte das Add-on neu

## Sicherheitshinweise

- Verwende `php_display_errors: "Off"` in Produktionsumgebungen
- Sei vorsichtig beim Öffnen des Add-ons für das Internet
- Implementiere Authentifizierung in deinen PHP-Anwendungen
- Speichere keine sensiblen Daten in öffentlich zugänglichen Verzeichnissen

## Support

Bei Problemen oder Fragen:
- GitHub Issues: [https://github.com/TillitschScHocK/PHP4HA/issues](https://github.com/TillitschScHocK/PHP4HA/issues)

## Lizenz

MIT License - siehe [LICENSE](LICENSE) Datei für Details.

## Changelog

Siehe [CHANGELOG.md](php/CHANGELOG.md) für alle Änderungen.
