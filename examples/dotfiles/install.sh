#!/bin/bash

INSTALL_PATH=~/dotfiles

# Install zsh configuration
if [ ! -d $INSTALL_PATH/zsh/plugins/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $INSTALL_PATH/zsh/plugins/powerlevel10k
fi

if [ ! -d $INSTALL_PATH/zsh/plugins/zsh-syntax-highlighting ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $INSTALL_PATH/zsh/plugins/zsh-syntax-highlighting
fi

if [ ! -d $INSTALL_PATH/zsh/plugins/zsh-autosuggestions ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $INSTALL_PATH/zsh/plugins/zsh-autosuggestions
fi

[ -f ~/.zshrc ] || ln -s $INSTALL_PATH/zsh/.zshrc ~/.zshrc

# Install neovim configuration
[ -d ~/.config/nvim ] || mkdir -p ~/.config/nvim
[ -f ~/.config/nvim/init.vim ] || ln -s $INSTALL_PATH/nvim/init.vim ~/.config/nvim/init.vim

# Install tmux configuration
[ -f ~/.tmux.conf ] || ln -s $INSTALL_PATH/tmux/.tmux.conf ~/.tmux.conf

# Install git configuration
[ -f ~/.gitconfig ] || ln -s $INSTALL_PATH/git/.gitconfig ~/.gitconfig

# Install vim plugs
# if the directory ~/.vim/plugged does not exist
# or if the ~/.vim/plugged is empty
if ([ ! -d ~/.vim/plugged ] || [ -z "$(ls -A ~/.vim/plugged)" ])
then
    # echo "Installing vim plugs ..."
    if DOTFILES_ROOT=$INSTALL_PATH nvim --headless +PlugInstall +qall; then
      # echo "vim plugs installed"
      :
    else
      echo "vim plugs could not be installed"
    fi
fi
