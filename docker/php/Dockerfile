FROM php:7.4-fpm

# PREPARE composer cache DIR
RUN mkdir -p /tmp/cache
RUN chown 1000:www-data -R /tmp/cache
RUN chmod 777 -R /tmp/cache

# SETUP COMPOSER
ENV COMPOSER_HOME=/tmp
RUN curl --silent --show-error https://getcomposer.org/composer.phar --output /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# PHP CONFIG
COPY zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY php-ini-overrides.ini /usr/local/etc/php/conf.d/99-overrides.ini
RUN ln -s /usr/local/bin/php /usr/bin/php

ARG APP_ENV

CMD ["php-fpm", "-R"]