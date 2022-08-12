#!/bin/bash

apt-get update

# timezone
apt-get -y install tzdata
ln -fs /usr/share/zoneinfo/$TIMEZONE /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# locale
# https://leimao.github.io/blog/Docker-Locale/
apt-get install -y locales locales-all
