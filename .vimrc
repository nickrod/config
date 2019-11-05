" first

syntax on
set nocompatible

" variables

set vb t_vb=
set matchpairs+=<:>
set laststatus=2
set showmatch
set showmode
set showcmd
set nowrap
set number
set wildmenu
set virtualedit=all
set ruler
set backspace=indent,eol,start

" file

set encoding=utf8
set tenc=utf8
set fileencoding=utf8

" search

set incsearch
set ignorecase
set nohls

" indent

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent

" map

map s <C-W>w
map q :q!<CR>
map Q :wq!<CR>
map - <C-W>-
map + <C-W>+
map ,w :w!<CR>
map ,s Ji<CR><ESC>_
