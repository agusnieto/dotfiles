set nocompatible
syntax on

set relativenumber
set number
set ruler

set backspace=indent,eol,start

set showcmd
set showmode
set scrolloff=5
set laststatus=2

set background=dark
set notermguicolors
hi LineNr ctermfg=DarkGray
hi CursorLineNr ctermfg=White

set hlsearch
set incsearch 
set ignorecase
set smartcase

set autoindent
" tabs = 4 spaces (Python)
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
" set list
set listchars=tab:>·,space:·,trail:~

