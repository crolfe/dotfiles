set expandtab
set hidden
set nocompatible
set noerrorbells
set number
set ruler " Text after a double-quote is a comment
set shiftwidth=4
set tabstop=4
set visualbell

syntax on
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
\ [%l/%L\ (%p%%)
filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
