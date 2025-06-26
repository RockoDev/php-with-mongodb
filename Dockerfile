FROM php:8.4.8-apache

# Install system dependencies
RUN apt-get -y update && apt-get -y install \
    pkg-config zlib1g-dev libcurl4-openssl-dev libssl-dev libpng-dev libxml2-dev libzip-dev libmagickwand-dev \
    git curl unzip vim --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Install MySQL and other PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql gd soap zip exif intl

# Install MongoDB extension
RUN pecl install mongodb imagick && docker-php-ext-enable mongodb imagick

# Install Composer
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin/ --filename=composer && \
    chmod +x /usr/local/bin/composer

# Install NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && apt-get install -y nodejs

# Clean up
RUN apt-get purge -y --auto-remove build-essential && rm -rf /var/lib/apt/lists/*
