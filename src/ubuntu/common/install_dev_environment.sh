#!/bin/bash

if [ "$NEOVIM_DEV_ENVIRONMENT" = "php" ]; then
    $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/8.0/install_php_environment.sh
elif [ "$NEOVIM_DEV_ENVIRONMENT" = "go" ]; then
    $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/go/1.19/install_go_environment.sh
fi
