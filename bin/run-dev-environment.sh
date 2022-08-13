#!/bin/bash

# https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$(realpath "${SCRIPT_DIR}/..")"

DEV=$1
VERSION=$2
PORT=$3

if [ -z "$DEV" ]; then
    echo "No dev environment specified"
    exit 1
fi

# Keep zsh history
[ ! -d $ROOT_DIR/.data/ubuntu/$DEV/.zsh ] && mkdir -p $ROOT_DIR/.data/ubuntu/$DEV/.zsh
# Keep vim plugs
[ ! -d $ROOT_DIR/.data/ubuntu/$DEV/.vim ] && mkdir -p $ROOT_DIR/.data/ubuntu/$DEV/.vim
# [ ! -d ./.data/ubuntu/plain/.vim/plugged ] && mkdir -p ./.data/ubuntu/plain/.vim/plugged
# Keep coc extensions
[ ! -d $ROOT_DIR/.data/ubuntu/$DEV/.config ] && mkdir -p $ROOT_DIR/.data/ubuntu/$DEV/.config
# [ ! -d ./.data/ubuntu/plain/.config/coc/extensions ] && mkdir -p ./.data/ubuntu/plain/.config/coc/extensions

# setting up volumes
params=(
    # keep zsh history
    -v $ROOT_DIR/.data/ubuntu/$DEV/.zsh:/home/docker/.zsh
    # keep vim plugins
    -v $ROOT_DIR/.data/ubuntu/$DEV/.vim:/home/docker/.vim
    # keep coc extensions
    -v $ROOT_DIR/.data/ubuntu/$DEV/.config:/home/docker/.config
    # use custom dotfiles
    -v ~/Code/dotfiles:/home/docker/dotfiles
    # source code to edit
    -v ~/Code:/home/docker/Code
)

# conditionally adding port
[ ! -z $PORT ] && params+=(-p $PORT:$PORT)

# last params
params+=(
    # transfer the recommend vim configuration for the environment
    -v $ROOT_DIR/src/ubuntu/environments:/neovim-dev-environments/environments
    # transfer the boostrap scripts
    -v $ROOT_DIR/bootstrap:/home/docker/bootstrap
    # --rm -it neovim-7.2/plain ./bootstrap/bootstrap-container.sh
    # --rm -it neovim-test/plain ./bootstrap/bootstrap-container.sh
    # --rm -it neovim-7.2/$DEV ./bootstrap/bootstrap-container.sh
    --rm -it "neovim/${DEV}${VERSION}" ./bootstrap/bootstrap-container.sh
)
docker run "${params[@]}"
