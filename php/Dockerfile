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
    bash

# Create symbolic link for php
RUN ln -s /usr/bin/php83 /usr/bin/php

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

# Create www directory
RUN mkdir -p /config/www

CMD [ "/run.sh" ]
