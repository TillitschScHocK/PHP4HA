# Home Assistant Add-on: PHP Web Server

## Installation

Folge diesen Schritten zur Installation des PHP Web Server Add-ons:

1. Navigiere zum Supervisor-Panel in deiner Home Assistant Oberfläche
2. Klicke auf den Add-on Store
3. Füge dieses Repository hinzu: `https://github.com/TillitschScHocK/PHP4HA`
4. Finde "PHP Web Server" und klicke auf Installieren

## Verwendung

Nach der Installation:

1. Konfiguriere die Add-on Einstellungen (Port, Unterverzeichnis, etc.)
2. Starte das Add-on
3. Überprüfe die Logs, um sicherzustellen, dass es erfolgreich gestartet wurde
4. Greife auf deinen PHP-Webserver zu: `http://homeassistant.local:8099`

## Konfiguration

Das Add-on kann mit folgenden Optionen konfiguriert werden:

### Port (erforderlich)

Der Netzwerk-Port, auf dem der PHP-Server lauschen wird.

```yaml
port: 8099
```

### Subdirectory (erforderlich)

Das Unterverzeichnis in `/config/www/`, in dem sich deine PHP-Dateien befinden.

```yaml
subdirectory: "php"
```

**Wichtig:** Das Add-on erstellt automatisch:
- `/config/www/` (falls nicht vorhanden)
- `/config/www/[subdirectory]/` (falls nicht vorhanden)
- Eine Standard-`index.php` (falls nicht vorhanden)

**Beispiele:**
- `subdirectory: "php"` → Document Root: `/config/www/php/`
- `subdirectory: "meine-app"` → Document Root: `/config/www/meine-app/`

### PHP Display Errors (optional)

Steuert, ob PHP-Fehler im Browser angezeigt werden.

- `On`: Fehler anzeigen (nützlich für Entwicklung)
- `Off`: Fehler verbergen (empfohlen für Produktion)

```yaml
php_display_errors: "Off"
```

### PHP Memory Limit (optional)

Setzt die maximale Speichermenge, die ein PHP-Skript verbrauchen darf.

```yaml
php_memory_limit: "128M"
```

## Enthaltene PHP-Extensions

Dieses Add-on enthält folgende PHP-Extensions:

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
- fileinfo

## Deine erste PHP-Seite erstellen

1. Das Add-on erstellt automatisch `/config/www/[subdirectory]/`
2. Beim ersten Start wird eine Standard-`index.php` erstellt
3. Du kannst diese bearbeiten oder eigene PHP-Dateien hinzufügen

**Beispiel:** Erstelle `/config/www/php/info.php`:

```php
<?php
echo "<h1>Willkommen bei PHP auf Home Assistant!</h1>";
phpinfo();
?>
```

Zugriff: `http://homeassistant.local:8099/info.php`

## Zugriff auf Home Assistant Daten

Da das Add-on Zugriff auf das `/config` Verzeichnis hat, kannst du Home Assistant Konfigurationsdateien lesen, auf die Datenbank zugreifen und mehr.

### Beispiel: YAML-Datei lesen

```php
<?php
$yaml_file = '/config/configuration.yaml';
if (file_exists($yaml_file)) {
    $content = file_get_contents($yaml_file);
    echo "<pre>" . htmlspecialchars($content) . "</pre>";
}
?>
```

### Beispiel: Dateien im config-Verzeichnis auflisten

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

### Add-on startet nicht

- Überprüfe die Add-on Logs auf Fehlermeldungen
- Stelle sicher, dass der Port nicht bereits verwendet wird
- Überprüfe, ob genügend Speicherplatz vorhanden ist

### Kann nicht auf den Webserver zugreifen

- Überprüfe, ob das Add-on läuft
- Überprüfe deine Home Assistant Netzwerkkonfiguration
- Versuche den Zugriff über die IP-Adresse statt Hostname
- Stelle sicher, dass der Port nicht durch eine Firewall blockiert wird

### PHP-Fehler werden nicht angezeigt

- Setze `php_display_errors: "On"` in der Konfiguration
- Starte das Add-on nach der Konfigurationsänderung neu

### Verzeichnis wird nicht erstellt

- Das Add-on erstellt automatisch `/config/www/[subdirectory]/`
- Überprüfe die Logs, ob Berechtigungsfehler auftreten
- Stelle sicher, dass `/config` beschreibbar ist

## Sicherheitshinweise

- Verwende `php_display_errors: "Off"` in Produktionsumgebungen
- Sei vorsichtig beim Öffnen dieses Add-ons für das Internet
- Implementiere eine ordnungsgemäße Authentifizierung in deinen PHP-Anwendungen
- Halte deinen PHP-Code sicher und aktuell
- Vermeide die Speicherung sensibler Daten in web-zugänglichen Verzeichnissen

## Support

Für Probleme, Fragen oder Feature-Requests:
- GitHub Issues: https://github.com/TillitschScHocK/PHP4HA/issues
