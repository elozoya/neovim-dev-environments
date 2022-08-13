#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# install php8.0
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get -y install php8.0-cli
apt-get -y install php8.0-common php8.0-bcmath openssl php8.0-mbstring php8.0-xml

# Install composer latest version
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); exit(1); } echo PHP_EOL;"

if [ $? -eq 0 ]; then
    php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
fi
