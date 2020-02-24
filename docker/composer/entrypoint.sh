#!/usr/bin/env bash
composer install;
composer global require phalcon/devtools;
ln -s /tmp/vendor/phalcon/devtools/phalcon /usr/local/bin/phalcon;