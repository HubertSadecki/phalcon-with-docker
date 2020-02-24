FROM php:7.4-fpm

# PREPARE composer cache DIR
RUN mkdir -p /tmp/cache
RUN chown 1000:www-data -R /tmp/cache
RUN chmod 777 -R /tmp/cache

# SETUP COMPOSER
ENV COMPOSER_HOME=/tmp
RUN curl --silent --show-error https://getcomposer.org/composer.phar --output /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# PHALCON REQUIREMENTS
# @see https://gist.github.com/chronon/95911d21928cff786e306c23e7d1d3f3
RUN apt-get update -y > /dev/null
RUN apt-get install zip unzip gcc libsqlite3-dev libicu-dev libpcre3-dev libyaml-dev libpq-dev -y > /dev/null
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql > /dev/null
RUN docker-php-ext-configure intl > /dev/null
RUN docker-php-ext-install pdo_pgsql intl pcntl > /dev/null

# ADD PECL EXTENSIONS
RUN pecl install psr > /dev/null
RUN pecl install yaml > /dev/null
RUN pecl install redis > /dev/null
RUN docker-php-ext-enable psr yaml redis > /dev/null

# INSTALL PHALCON
RUN pecl install phalcon > /dev/null
RUN docker-php-ext-enable phalcon > /dev/null

# PHP CONFIG
COPY zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY php-ini-overrides.ini /usr/local/etc/php/conf.d/99-overrides.ini
RUN ln -s /usr/local/bin/php /usr/bin/php

ARG APP_ENV

RUN composer global require phalcon/devtools > /dev/null
ENV PATH="/tmp/vendor/bin:${PATH}"

CMD ["php-fpm", "-R"]