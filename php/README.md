# Home Assistant Add-on: PHP Web Server

![Version](https://img.shields.io/badge/version-1.0.1-blue.svg)

## About

Dieser Add-on stellt einen PHP-Webserver mit direktem Zugriff auf dein Home Assistant Konfigurationsverzeichnis bereit. Perfekt für eigene PHP-Anwendungen, Dashboards oder Tools, die mit Home Assistant integriert werden sollen.

## Features

- 🚀 PHP 8.3 mit gängigen Extensions
- 📁 Direkter Zugriff auf `/config` Verzeichnis
- ⚙️ Konfigurierbares Unterverzeichnis
- 🔧 Anpassbare PHP-Einstellungen
- 🌐 Web-basierter Zugriff auf deine PHP-Anwendungen

## Installation

1. Füge dieses Repository zu deinem Home Assistant Add-on Store hinzu:
   - Gehe zu **Einstellungen** → **Add-ons** → **Add-on Store** → **⋮** (oben rechts) → **Repositories**
   - Füge hinzu: `https://github.com/TillitschScHocK/PHP4HA`

2. Finde "PHP Web Server" im Add-on Store und klicke auf **Installieren**

3. Konfiguriere das Add-on (siehe Konfiguration unten)

4. Starte das Add-on

## Konfiguration

Beispiel-Konfiguration:

```yaml
port: 8099
subdirectory: "php"
php_display_errors: "Off"
php_memory_limit: "128M"
```

### Option: `port`

Der Port, auf dem der PHP-Webserver lauscht.

### Option: `subdirectory`

Der Unterordner in `/config/www/` für deine PHP-Dateien. 
Dein Document Root wird dann: `/config/www/[subdirectory]`

Beispiel: Mit `subdirectory: "php"` wird das Verzeichnis `/config/www/php` verwendet.

### Option: `php_display_errors`

Ob PHP-Fehler angezeigt werden sollen. Verwende "On" für Entwicklung, "Off" für Produktion.

### Option: `php_memory_limit`

PHP Speicherlimit. Standard ist "128M".

## Verwendung

1. Das Add-on erstellt automatisch das Verzeichnis `/config/www/[subdirectory]`
2. Platziere deine PHP-Dateien in diesem Verzeichnis
3. Greife auf deine PHP-Anwendung zu: `http://homeassistant.local:8099`

### Beispiel PHP-Datei

Erstelle `/config/www/php/test.php`:

```php
<?php
echo "<h1>Hallo von Home Assistant!</h1>";
echo "<p>Server-Zeit: " . date('d.m.Y H:i:s') . "</p>";
?>
```

Zugriff: `http://homeassistant.local:8099/test.php`

## Support

Für Probleme und Feature-Requests besuche bitte:
https://github.com/TillitschScHocK/PHP4HA/issues

## Lizenz

MIT License - siehe LICENSE Datei für Details
