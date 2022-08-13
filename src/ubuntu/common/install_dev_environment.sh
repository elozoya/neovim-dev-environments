#!/bin/bash

version=$NEOVIM_DEV_ENVIRONMENT_VERSION

if [ "$NEOVIM_DEV_ENVIRONMENT" = "php" ]; then
  $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/common/install_php.sh $version
  $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/common/install_composer.sh
elif [ "$NEOVIM_DEV_ENVIRONMENT" = "go" ]; then
  $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/go/1.19/install_go_environment.sh
fi
