filetype off

execute pathogen#infect()

syntax on

"call pathogen#runtime_append_all_bundles()"

filetype plugin indent on



set nocompatible



set modelines=0



set tabstop=4

set shiftwidth=4

set softtabstop=4

set expandtab



set encoding=utf-8

set scrolloff=3

set autoindent

set showmode

set showcmd

set hidden

set wildmenu

set wildmode=list:longest

set visualbell

set cursorline

set ttyfast

set ruler

set backspace=indent,eol,start

set laststatus=2

set relativenumber

set undofile



let mapleader = ","



set wrap

set textwidth=79

set formatoptions=qrn1

set colorcolumn=85



nnoremap ; :



"reselect the text that was just pasted so I can perform commands (like

"indentation) on it:"

nnoremap <leader>q gqip



"Go to edit mode with jj"

inoremap jj <ESC>



",w for split screen"

nnoremap <leader>w <C-w>v<C-w>l



"open NERDTree automatically"

autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeShowHidden=1



" Smart way to move between windows"

map <C-j> <C-W>j

map <C-k> <C-W>k

map <C-h> <C-W>h

map <C-l> <C-W>l



map <C-J> :bnext<CR>

map <C-K> :bprev<CR>

map <C-L> :tabn<CR>

map <C-H> :tabp<CR>



"https://github.com/jistr/vim-nerdtree-tabs"

"set NERDTreeTabsOpen"

:set foldmethod=indent
set clipboard=unnamed
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line
                    "    according to
                    "                        "    shiftwidth, not tabstop
                    "
nnoremap <tab> %
vnoremap <tab> %
