#!/usr/bin/with-contenv bashio

# Get configuration
PORT=$(bashio::config 'port')
DOCUMENT_ROOT=$(bashio::config 'document_root')
PHP_DISPLAY_ERRORS=$(bashio::config 'php_display_errors')
PHP_MEMORY_LIMIT=$(bashio::config 'php_memory_limit')

bashio::log.info "Starting PHP Web Server..."
bashio::log.info "Port: ${PORT}"
bashio::log.info "Document Root: ${DOCUMENT_ROOT}"

# Create document root if it doesn't exist
if [ ! -d "${DOCUMENT_ROOT}" ]; then
    bashio::log.info "Creating document root directory: ${DOCUMENT_ROOT}"
    mkdir -p "${DOCUMENT_ROOT}"
fi

# Create a default index.php if none exists
if [ ! -f "${DOCUMENT_ROOT}/index.php" ]; then
    bashio::log.info "Creating default index.php"
    cat > "${DOCUMENT_ROOT}/index.php" << 'EOF'
<?php
phpinfo();
?>
EOF
fi

# Set PHP configuration
export PHP_DISPLAY_ERRORS="${PHP_DISPLAY_ERRORS}"
export PHP_MEMORY_LIMIT="${PHP_MEMORY_LIMIT}"

bashio::log.info "PHP Web Server started on port ${PORT}"
bashio::log.info "Access your PHP files at: http://homeassistant.local:${PORT}"

# Start PHP built-in web server
cd "${DOCUMENT_ROOT}"
exec php -S 0.0.0.0:${PORT} \
    -d display_errors="${PHP_DISPLAY_ERRORS}" \
    -d memory_limit="${PHP_MEMORY_LIMIT}" \
    -d error_reporting=E_ALL
