#!/bin/bash

# install dotfiles
~/dotfiles/install.sh

# start shell session
if [ ! -z $SHELL ]; then
  $SHELL
else
  bash
fi
