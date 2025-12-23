" vi improved
filetype plugin indent on
set nocompatible
syntax on
set backspace=indent,eol,start

" interface
set relativenumber
set number
set ruler
set showcmd
set noshowmode
set scrolloff=5
set laststatus=2

" search
set hlsearch
set incsearch 
set ignorecase
set smartcase

" indentation & tabs
set smartindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 " PEP8 standard 
set listchars=tab:>·,space:·,trail:~
