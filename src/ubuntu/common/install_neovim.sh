#!/bin/bash

# STEP: Install neovim
apt-get -qq -y install software-properties-common
add-apt-repository universe
apt-get -y upgrade
if [ "$NEOVIM_VERSION" = "STABLE" ] ; then add-apt-repository -y ppa:neovim-ppa/stable ; fi
if [ "$NEOVIM_VERSION" = "UNSTABLE" ] ; then add-apt-repository -y ppa:neovim-ppa/unstable ; fi
apt-get update
apt-get -y install neovim

# STEP: Install neovim checkhealth
if [ "$NEOVIM_CHECKHEALTH" = "FULL" ]
then
    # install python
    apt-get -y install python3 python3-pip python3-neovim
    # pip3 throws a warning if it is run using root
    pip3 install --upgrade pynvim

    # install ruby
    apt-get -y install ruby-full
    gem install neovim

    # install NodeJS & NPM
    apt-get -y install curl
    curl -sL https://deb.nodesource.com/setup_16.x | bash -
    apt-get install -y nodejs
    npm install --location=global neovim
fi
