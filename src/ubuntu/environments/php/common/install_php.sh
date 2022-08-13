#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# default version is php8.0
version=${1:-8.0}

# install php
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get -y install openssl \
  php$version-cli \
  php$version-common \
  php$version-bcmath \
  php$version-mbstring \
  php$version-xml
