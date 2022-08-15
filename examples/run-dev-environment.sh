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

DEVFULL=$DEV$VERSION

# Keep zsh history
[ ! -d $ROOT_DIR/.data/ubuntu/$DEVFULL/.zsh ] && mkdir -p $ROOT_DIR/.data/ubuntu/$DEVFULL/.zsh
# Keep vim plugs
[ ! -d $ROOT_DIR/.data/ubuntu/$DEVFULL/.vim ] && mkdir -p $ROOT_DIR/.data/ubuntu/$DEVFULL/.vim
# [ ! -d ./.data/ubuntu/plain/.vim/plugged ] && mkdir -p ./.data/ubuntu/plain/.vim/plugged
# Keep coc extensions
[ ! -d $ROOT_DIR/.data/ubuntu/$DEVFULL/.config ] && mkdir -p $ROOT_DIR/.data/ubuntu/$DEVFULL/.config
# [ ! -d ./.data/ubuntu/plain/.config/coc/extensions ] && mkdir -p ./.data/ubuntu/plain/.config/coc/extensions

# setting up volumes
params=(
    # keep zsh history
    -v $ROOT_DIR/.data/ubuntu/$DEVFULL/.zsh:/home/docker/.zsh
    # keep vim plugins
    -v $ROOT_DIR/.data/ubuntu/$DEVFULL/.vim:/home/docker/.vim
    # keep coc extensions
    -v $ROOT_DIR/.data/ubuntu/$DEVFULL/.config:/home/docker/.config
    # use custom dotfiles
    -v $ROOT_DIR/examples/dotfiles:/home/docker/dotfiles
    # source code to edit
    -v ~/Code:/home/docker/Code
)

# conditionally adding port
[ ! -z $PORT ] && params+=(-p $PORT:$PORT)

# last params
params+=(
    # transfer the recommend vim configuration for the environment
    -v $ROOT_DIR/src/ubuntu/environments:/neovim-dev-environments/environments
    # transfer the boostrap script
    -v $ROOT_DIR/examples:/home/docker/.bootstrap-dev-environment
    # --rm -it neovim-7.2/plain ./bootstrap/bootstrap-container.sh
    # --rm -it neovim-test/plain ./bootstrap/bootstrap-container.sh
    # --rm -it neovim-7.2/$DEVFULL ./bootstrap/bootstrap-container.sh
    --rm -it "neovim/$DEVFULL" ./.bootstrap-dev-environment/bootstrap-container.sh
)
docker run "${params[@]}"
