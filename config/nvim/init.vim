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
Plug 'ddollar/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'yosiat/oceanic-next-vim'
Plug 'geekjuice/vim-mocha'
Plug 'vim-scripts/BufOnly.vim'
Plug 'fatih/vim-go'
Plug 'mustache/vim-mustache-handlebars'
call plug#end()

" neovim theme setting
" https://github.com/mhartington/oceanic-next
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1


set background=dark
syntax enable
" colorscheme molokai
" colorscheme OceanicNext
colorscheme monokai

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

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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

" Scroll ahead of the cursor
set so=5

" CtrlP ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules

" Merge vim and OSX clipboards
set clipboard=unnamed


let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='oceanicnext'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Cycle through buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Close buffer without fucking up nerdtree
nnoremap <leader>q :bp<cr>:bd #<cr>

" Close buffer window
nnoremap <leader>w :bd<cr>

nmap <leader>, :w<cr>

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

" Comment/Uncomment
noremap <leader>/ :call NERDComment(0,"toggle")<CR>

" Auto format
map <leader>f :Esformatter<CR>

" remap esc
inoremap jk <esc>

" wipout buffer
nmap <silent> <leader>b :bw<cr>

" close all other buffers
nmap <leader>W :BufOnly<CR>

" shortcut to save
nmap <leader>, :w<cr>

" Enter to clear search highlight
nnoremap <CR> :noh<CR><CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_go_checkers = ['go']
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" vim-mocha
let g:mocha_js_command = "!mocha --no-colors {spec}"
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" popup menu navigation with hjkl
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

" Load local project directory settings
silent! so .vimlocal

" Project specific editor settings
function SmoochCoreJs()
    set wildignore+=lib,dist,amd
    let g:NERDTreeIgnore = ['lib', 'dist', 'amd']
endfunction
autocmd BufRead,BufNewFile */smooch-core-js/* call SmoochCoreJs()
