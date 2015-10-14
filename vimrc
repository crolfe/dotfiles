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

" All plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Python syntax highlighting
let python_highlight_all = 1

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

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup below.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" wrap in autocmd in augroup to ensure they are only applied once
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.py,*.js,*.txt,*.md ▷⋅⋅⋅\:call <SID>StripTrailingWhitespaces()
augroup END
