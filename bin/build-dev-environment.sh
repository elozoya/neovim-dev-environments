#!/bin/bash

# https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$(realpath "${SCRIPT_DIR}/..")"

DEV=$1

if [ -z "$DEV" ]; then
    echo "No dev environment specified"
    exit 1
fi

available_environments=(
  plain
  php
  go
)

DOCKER_IMAGE_TAG=neovim/$DEV
params=(
    --build-arg NEOVIM_DEV_ENVIRONMENT=$DEV
    -t $DOCKER_IMAGE_TAG
    -f $ROOT_DIR/src/ubuntu/Dockerfile
    $ROOT_DIR/src/ubuntu
)
docker build "${params[@]}"
