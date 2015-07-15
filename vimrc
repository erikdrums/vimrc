filetype off
set nocompatible


" set the runtime path to include Vundle and initialize
":PluginInstall
":PluginUpdate
":Plugins
":PluginSearch!
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorscheme'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
"  Plugin 'rbgrouleff/bclose'
Plugin 'moll/vim-bbye'
Plugin 'mileszs/ack.vim'
"Plugin 'andviro/flake8-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
"call pathogen#runtime_append_all_bundles()"
" let Vundle manage Vundle, required
syntax on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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



let mapleader = "\<space>"



"  set wrap
set nowrap
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
inoremap <leader>e <esc>:w<cr> 

nnoremap <Leader>w :w<CR>

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
set ignorecase                                                                    
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line
                    "    according to
                    "                        "    shiftwidth, not tabstop
                    "
nnoremap <tab> %
vnoremap <tab> %
if has("gui_running")                                                                
    colorscheme solarized                                                            
    set background=dark                                                              
    set guioptions-=T                                                                
    set guioptions+=e                                                                
    set t_Co=256                                                                     
    set guitablabel=%M\ %t                                                           
endif 
let NERDTreeIgnore = ['\.pyc$', '\.orig$', '\.swp$', '\.swo$', '\.un\~$'] 
let g:jedi#use_tabs_not_buffers = 0 

set autoread                                                                      
"Select just pasted text                                                          
nnoremap gp `[v`]                                                                 
"
" reload .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

"  Treat underscore as space
set iskeyword-=_
"   Use whole sentence to search
vnoremap // y/<C-R>"<CR>


:nmap <silent> <leader>q :Bdelete<CR>
:nmap <silent> <leader>b :NERDTreeToggle<CR>

"  Resize split window
:nmap <leader>r+ :vertical resize +10<CR>
:nmap <leader>r- :vertical resize -10<CR>
:nnoremap <silent> <leader>v 0wv$
:vnoremap <silent> <leader>x "aydd
:vnoremap <silent> <leader>c "ay
:nnoremap <silent> <leader>p "ap

"   :noremap <silent> <leader>f /function/ge<bar> /def /eg <CR>zt
"   :noremap <silent>  <leader>f :silent /function \|class <CR>zt
:noremap <silent>  <leader>f :silent! /function /<CR> <bar> :silent! /def /<CR> <bar>:silent! /class /<CR>zt
:noremap <silent>  <leader>d :silent! /function /<CR>NNzt <bar> :silent! /def /<CR>NNzt <bar>:silent! /class /<CR>NNzt
"   silent! :noremap <silent> <leader>d /function <CR>NNzt
"  :silent /function \|class virker

set pastetoggle=<F2>
:ab vd var_dump()<Left> 
:ab p <?php
:ab cl console.log()<Left>
:noremap <C-W>j <C-W><Left>
:noremap <C-W>k <C-W><Right>

:noremap <silent> <leader>ciw F<Space>Wvt<Space>di
