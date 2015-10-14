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
Plugin 'python-rope/ropevim'
Bundle 'matze/vim-move'
Bundle 'hdima/python-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Python syntax highlighting
let python_highlight_all = 1

colorscheme molokai  " https://github.com/tomasr/molokai
set nobackup
set nowritebackup
set noswapfile
set lines=40
set columns=80     " column width
set lines=50
set tabstop=4      " number of visual spaces per TAB
set textwidth=79   " PEP8-friendly line length
set colorcolumn=80  " vertical line at max line length
set shiftwidth=4   " how many columns the reindent operations (<< and >>)
set softtabstop=4  " how many columns when hit Tab in insert mode
set expandtab      " tabs are spaces
set number         " show line numbers
set showcmd        " show command in bottom bar
set showmatch      " shows matching parentheses
syntax enable      " enable syntax processing

set clipboard=unnamed  " yank to clipboard

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir,
                                'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
