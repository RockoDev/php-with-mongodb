FROM php:8.4.8-apache

# Install system dependencies
RUN apt-get -y update && apt-get -y install libcurl4-openssl-dev pkg-config libssl-dev git curl && rm -rf /var/lib/apt/lists/*

# Install MongoDB extension
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions mongodb

# Install Composer
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin/ --filename=composer
RUN chmod +x /usr/local/bin/composer

# Install NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs

# Clean up
RUN apt-get purge -y --auto-remove build-essential && rm -rf /var/lib/apt/lists/*
