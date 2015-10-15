set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Bundle 'matze/vim-move'
Bundle 'hdima/python-syntax'
Bundle 'scrooloose/nerdcommenter'

" All plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" vim-move: Ctrl + k/j to move up/down
let g:move_key_modifier = 'C'

" Python syntax highlighting
let python_highlight_all = 1

" convenience mapping for ESC
imap ;; <Esc>

" space is your leader
let mapleader = "\<Space>"

colorscheme molokai  " https://github.com/tomasr/molokai
set nobackup
set nowritebackup
set noswapfile

set tabstop=4        " number of visual spaces per TAB
set textwidth=79     " PEP8-friendly line length
set colorcolumn=80   " vertical line at max line length
set shiftwidth=4     " how many columns the reindent operations (<< and >>) use
set softtabstop=4    " how many columns when hit Tab in insert mode
set expandtab        " tabs are spaces
set number           " show line numbers
set showcmd          " show command in bottom bar
set showmatch        " shows matching parentheses
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅  " show invisible characters
syntax enable        " enable syntax processing
set clipboard=unnamed  " yank to clipboard

"use tabs for go
autocmd Filetype go setlocal noexpandtab
