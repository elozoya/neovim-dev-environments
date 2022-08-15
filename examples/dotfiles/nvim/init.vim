" Plugs
call plug#begin('~/.vim/plugged')
" Plugs for every programming language
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'

" File explorers
" Plug 'scrooloose/nerdtree'
" Plug 'kyazdani42/nvim-web-devicons' | Plug 'kyazdani42/nvim-tree.lua'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'

" Plugs for especific programming languages
if $NEOVIM_DEV_ENVIRONMENT == 'php'
  source $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/recommended/plugs.vim
elseif $NEOVIM_DEV_ENVIRONMENT == 'go'
  " source $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/go/recommended/plugs.vim
endif
call plug#end()

"main
set inccommand=nosplit " highlight search while typing %s command https://github.com/neovim/neovim/issues/12308
set number relativenumber
let mapleader = " " " map leader to Space

" themes
" ======
set termguicolors
" dracula
colorscheme dracula
" tokyonight
" colorscheme tokyonight
" gruvbox
" let g:gruvbox_italic=1
" set background=dark
" colorscheme gruvbox
" onedark
" set background=dark
" colorscheme onedark

" https://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup custom_indenting
  autocmd!
  autocmd FileType * set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
augroup END


" Configuration for especific programming languages
if $NEOVIM_DEV_ENVIRONMENT == 'php'
  source $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/recommended/coc_extensions.vim
  source $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/php/recommended/indentation.vim
elseif $NEOVIM_DEV_ENVIRONMENT == 'go'
  source $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments/go/recommended/coc_extensions.vim
endif
