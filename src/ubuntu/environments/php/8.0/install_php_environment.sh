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
