#!/bin/bash

# These packages are NOT required for neovim
apt-get -y install curl wget git

# Add your custom packages
apt-get -y install ack bat ripgrep fzf tmux tree vifm
