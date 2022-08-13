#!/bin/bash

# install php8.1
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get -y install php8.1-cli
apt-get -y install php8.1-common php8.1-bcmath openssl php8.1-mbstring php8.1-xml
