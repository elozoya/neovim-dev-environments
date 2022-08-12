#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

user=${USER_NAME:-$SUDO_USER}

if ! id -u "$user" >/dev/null 2>&1 ; then
  echo "user does not exist"
  exit 1
fi

# uninstall previous
[ -d ~/.config/nvim ] && rm -rf /usr/local/go

# download and install
wget --directory-prefix=/tmp https://go.dev/dl/go1.19.linux-amd64.tar.gz
tar -C /usr/local -xzf /tmp/go1.19.linux-amd64.tar.gz
