#!/bin/bash

# nvim configuration
[ ! -d ~/.config/nvim ] && mkdir -p .config/nvim
[ ! -f ~/.config/nvim/init.vim ] && ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# Install Vim Plugs only for the first time
([ ! -d ~/.vim/plugged ] || [ -z "$(ls -A ~/.vim/plugged)" ]) && DOTFILES_ROOT=~/dotfiles nvim --headless +PlugInstall +qall

# dotfiles
[ ! -f ~/.zshrc ] && ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
[ ! -f ~/.gitconfig ] && ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
[ ! -f ~/.tmux.conf ] && ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# installing zsh plugins only for the first time
if [ ! -d ~/dotfiles/zsh/plugins/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/dotfiles/zsh/plugins/powerlevel10k
fi

if [ ! -d ~/dotfiles/zsh/plugins/zsh-syntax-highlighting ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/dotfiles/zsh/plugins/zsh-syntax-highlighting
fi

if [ ! -d ~/dotfiles/zsh/plugins/zsh-autosuggestions ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/dotfiles/zsh/plugins/zsh-autosuggestions
fi

# start shell session
if [ ! -z $SHELL ]; then
  $SHELL
else
  bash
fi
