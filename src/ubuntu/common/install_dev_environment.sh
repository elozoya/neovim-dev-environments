#!/bin/bash

version=$NEOVIM_DEV_ENVIRONMENT_VERSION

if [ "$NEOVIM_DEV_ENVIRONMENT" = "php" ]; then
  if [ "$version" = "7.4" ]; then
    $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/7.4/install_php_environment.sh
  elif [ "$version" = "8.0" ]; then
    $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/8.0/install_php_environment.sh
  elif [ "$version" = "8.1" ]; then
    $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/8.1/install_php_environment.sh
  else
    # default version
    $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/8.1/install_php_environment.sh
  fi
  $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/common/install_composer.sh
elif [ "$NEOVIM_DEV_ENVIRONMENT" = "go" ]; then
  $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/go/1.19/install_go_environment.sh
fi
