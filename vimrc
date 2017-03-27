set shell=bash                " for compatability with xonsh
set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'JamshedVesuna/vim-markdown-preview'

Bundle 'elzr/vim-json'
Bundle 'hdima/python-syntax'
Bundle 'matze/vim-move'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-syntastic/syntastic'

" All plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Python syntax highlighting
let python_highlight_all = 1

" vim-move: Ctrl + k/j to move up/down
let g:move_key_modifier = 'C'

autocmd BufWritePre * StripWhitespace  " strip whitespace on save

colorscheme stereokai  " https://github.com/tomasr/stereokai
set nobackup
set nowritebackup
set noswapfile

set tabstop=4        " number of visual spaces per TAB
set colorcolumn=120   " vertical line at max line length
set shiftwidth=4     " how many columns the reindent operations (<< and >>) use
set softtabstop=4    " how many columns when hit Tab in insert mode
set expandtab        " tabs are spaces
set number           " show line numbers
set showcmd          " show command in bottom bar
set showmatch        " shows matching parentheses
syntax enable        " enable syntax processing
set clipboard=unnamed  " yank to clipboard
set backspace=2 " make backspace work like most other apps
set tw=120       " visual select a long line and split it up with gq
" convenience mapping for ESC
imap ;; <Esc>

" space is your leader
let mapleader = "\<Space>"

" use tabs for go
autocmd Filetype go setlocal noexpandtab

" use 2 space tabs for html, yaml, and javascript
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" format JSON in Visual mode
map <Leader>j !python -m json.tool<CR>

" python-syntax
let python_highlight_all = 1

" :PrettyXML
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" show unsaved changes
command Diff :w !diff % -


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0"
