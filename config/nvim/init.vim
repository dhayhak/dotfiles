" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required

" set a map leader for more key combos
let mapleader = ','
let maplocalleader = ','
let g:mapleader = ','

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'millermedeiros/vim-esformatter'
call plug#end()

set background=dark
syntax enable
colorscheme molokai

" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:         Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Modified by :          Ben McCormick
" Last change:             2014 June 8
"
" To use it, copy it to
"  for Unix based systems (including OSX and Linux):  ~/.vimrc
"  for Windows :  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.


" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

set bs=2
set nowrap
set tabstop=4
set expandtab
set ignorecase    " ignore case when searching
set autoindent    " always set autoindenting on
set shiftwidth=4
set copyindent    " copy the previous indentation on autoindenting
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
set mouse=a
set pastetoggle=<F2>
" set timeoutlen=50 ttimeoutlen=0

" CtrlP ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules

" Merge vim and OSX clipboards
set clipboard=unnamed


let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Close buffer without fucking up nerdtree
nnoremap <leader>q :bp<cr>:bd #<cr>

nnoremap <leader d>dd
nmap <leader>, :w<cr>

nnoremap ; :
nnoremap j gj
nnoremap k gk

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-n> :NERDTreeToggle<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

let NERDTreeIgnore = ['node_modules']
map <leader>w :BufOnly
