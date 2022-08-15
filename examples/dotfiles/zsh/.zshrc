# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# dotfiles root directory
export DOTFILES_ROOT=~/dotfiles

source $DOTFILES_ROOT/zsh/.zshrc_5.8.1_default
source $DOTFILES_ROOT/zsh/.zshrc_alias
source $DOTFILES_ROOT/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $DOTFILES_ROOT/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES_ROOT/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858"

# change history file location
HISTFILE=~/.zsh/.zsh_history

# To create your own prompt theme, run `p10k configure`

# source a basic example zsh p10k theme
# [[ ! -f $DOTFILES_ROOT/zsh/.p10k-example-theme-basic.zsh ]] || source $DOTFILES_ROOT/zsh/.p10k-example-theme-basic.zsh
#
# source an example zsh p10k theme with many icons
[[ ! -f $DOTFILES_ROOT/zsh/.p10k-example-theme-with-icons.zsh ]] || source $DOTFILES_ROOT/zsh/.p10k-example-theme-with-icons.zsh

# add go to the path if it is installed
[ -d "/usr/local/go/bin" ] && export PATH=$PATH:/usr/local/go/bin

