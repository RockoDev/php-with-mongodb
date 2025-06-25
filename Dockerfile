FROM php:8.4.8-apache

RUN apt-get -y update && apt-get -y install libcurl4-openssl-dev pkg-config libssl-dev git curl nodejs npm && rm -rf /var/lib/apt/lists/*

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions

RUN install-php-extensions mongodb

RUN apt-get purge -y --auto-remove build-essential && rm -rf /var/lib/apt/lists/*

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin/ --filename=composer

RUN chmod +x /usr/local/bin/composer

# ENV NVM_DIR=/usr/local/.nvm
# ENV NODE_VERSION=22

# RUN mkdir -p "$NVM_DIR" && chown www-data:www-data "$NVM_DIR"

# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && \
#     bash -c ". \"$NVM_DIR/nvm.sh\" && nvm install $NODE_VERSION && nvm use $NODE_VERSION"
