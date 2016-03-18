filetype off
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
"  Plugin 'rbgrouleff/bclose'
Plugin 'moll/vim-bbye'
"Plugin 'mileszs/ack.vim'
"Plugin 'easygrep'
Plugin 'dkprice/vim-easygrep'
Plugin 'szw/vim-tags'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'matze/vim-move'
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'andviro/flake8-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
"call pathogen#runtime_append_all_bundles()"
" let Vundle manage Vundle, required
syntax on
syntax enable

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.orig,sundhedstallet/node_modules/

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Support virtualenv
let g:pymode_virtualenv = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set clipboard=unnamedplus

"Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"Syntastic set filetype and checker
let g:syntastic_python_flake8_args="--ignore=E123,E126,E127,E501,E128,E124,E121,E302"
let g:syntastic_php_flake8_args="--ignore=E126,E127,E501"

"Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command = 'vertical-split'

"python with virtualenv support
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

"CTAGS
nmap <C-Enter> <C-w><C-]><C-w>T

set modelines=0
set tabstop=4
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set showmatch
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
let python_highlight_all = 1

let mapleader = ","

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
inoremap <leader>w <esc>:w<cr> 

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

"Jedi settings.
let g:jedi#use_tabs_not_buffers = 0 
let g:jedi#use_splits_not_buffers = "right"

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
"set iskeyword-=_
"   Use whole sentence to search
vnoremap // y/<C-R>"<CR>


:nmap <silent> <leader>q :Bdelete<CR>
:nmap <silent> <leader>b :NERDTreeToggle<CR>
:noremap <silent> <leader>e :w<ENTER>:bd<ENTER> 

"  Resize split window
:nmap <leader>+ :vertical resize +10<CR>
:nmap <leader>- :vertical resize -10<CR>

:nnoremap <silent> <leader>v 0wv$
:vnoremap <silent> <leader>x "aygvd<<
:vnoremap <silent> <leader>c "ay
:nnoremap <silent> <leader>p o<space><ESC>"api<ESC>x
:nnoremap <silent> <leader>pp "ap
:noremap <leader>by bve"ay<ESC> 

"   :noremap <silent> <leader>f /function/ge<bar> /def /eg <CR>zt
"   :noremap <silent>  <leader>f :silent /function \|class <CR>zt
:noremap <silent>  <leader>f :silent! /function /<CR> <bar> :silent! /def /<CR> <bar>:silent! /class /<CR>zt
:noremap <silent>  <leader>d :silent! /function /<CR>NNzt <bar> :silent! /def /<CR>NNzt <bar>:silent! /class /<CR>NNzt
"   silent! :noremap <silent> <leader>d /function <CR>NNzt
"  :silent /function \|class virker

set pastetoggle=<F2>
:ab vd var_dump();<Left><Left> 

:ab p <?php
:ab cl console.log()<Left>
":ab pp import pprint<Enter>pprint.pprint()<Left>
:noremap <C-W>j <C-W><Left>
:noremap <C-W>k <C-W><Right>
:noremap <silent> <leader><Space> i<space><ESC>
:ab pp from pprint import pprint<ESC>opprint()<ESC>i

:noremap <silent> <leader>ciw F<Space>Wvt<Space>di
:noremap <silent> <leader>viw F<Space>Wvt<Space>"ay
:noremap <silent> <leader><Space> i<Space><ESC>
:noremap <silent> <leader>' bi'<ESC>ea'<ESC>
:noremap <silent> <leader>ø bhxelx
:noremap <silent> <leader>3 I#<ESC>:w<ENTER>
:noremap <silent> <leader>4 0wx:w<ENTER>
:noremap <silent> <leader>7 I//<ESC>:w<ENTER>
:noremap <silent> <leader>8 0wxx:w<ENTER>

:noremap <leader>gl :YcmCompleter GoToDeclaration<CR>
:noremap <leader>gf :YcmCompleter GoToDefinition<CR>
:noremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

nnoremap ^[j :m .+1<CR>==
nnoremap ^[k :m .-2<CR>==
inoremap ^[j <Esc>:m .+1<CR>==gi
inoremap ^[k <Esc>:m .-2<CR>==gi
vnoremap ^[j :m '>+1<CR>gv=gv
vnoremap ^[k :m '<-2<CR>gv=gv


:nnoremap <leader>0 :Ag! <C-r><C-w><ENTER>

:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gcI<LEFT><LEFT><LEFT><LEFT>

:nnoremap <Leader>9 g<C-]>

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
