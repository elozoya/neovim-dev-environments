#!/bin/bash

# install php7.4
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get -y install php7.4-cli
apt-get -y install php7.4-common php7.4-bcmath openssl php7.4-mbstring php7.4-xml
