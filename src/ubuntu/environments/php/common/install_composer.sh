#!/bin/bash

# Install composer latest version
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); exit(1); } echo PHP_EOL;"

if [ $? -eq 0 ]; then
    php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
fi
