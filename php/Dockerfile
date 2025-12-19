ARG BUILD_FROM
FROM $BUILD_FROM

# Install PHP and necessary extensions
RUN apk add --no-cache \
    php83 \
    php83-fpm \
    php83-opcache \
    php83-mysqli \
    php83-json \
    php83-openssl \
    php83-curl \
    php83-zlib \
    php83-xml \
    php83-phar \
    php83-intl \
    php83-dom \
    php83-xmlreader \
    php83-xmlwriter \
    php83-simplexml \
    php83-ctype \
    php83-mbstring \
    php83-gd \
    php83-session \
    php83-pdo \
    php83-pdo_mysql \
    php83-pdo_sqlite \
    php83-fileinfo \
    bash \
    jq

# Create symbolic link for php
RUN ln -s /usr/bin/php83 /usr/bin/php

# Copy data
COPY rootfs /

# Make run script executable
RUN chmod a+x /etc/services.d/php-server/run

WORKDIR /
