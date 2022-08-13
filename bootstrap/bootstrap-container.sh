#!/bin/bash

# nvim configuration
[ ! -d ~/.config/nvim ] && mkdir -p .config/nvim
[ ! -f ~/.config/nvim/init.vim ] && ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# Install Vim Plugs only for the first time
([ ! -d ~/.vim/plugged ] || [ -z "$(ls -A ~/.vim/plugged)" ]) && nvim --headless +PlugInstall +qall

# dotfiles
[ ! -f ~/.zshrc ] && ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
[ ! -f ~/.gitconfig ] && ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
[ ! -f ~/.tmux.conf ] && ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# start shell session
if [ ! -z $SHELL ]; then
  $SHELL
else
  bash
fi
