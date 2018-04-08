" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required
" filetype plugin on

" set a map leader for more key combos
let mapleader = ','
let maplocalleader = ','
let g:mapleader = ','

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attributebbr funciton function

" Python used by ultisnips, deoplete
let g:python_host_prog = '/Users/andrew/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/andrew/.pyenv/versions/neovim3/bin/python'

call plug#begin()
" Hub extension for fugitive
Plug 'tpope/vim-rhubarb'

" Git
Plug 'tpope/vim-fugitive'

" mappings which are simply short normal mode aliases for commonly used ex commands 
Plug 'tpope/vim-unimpaired'

" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-surround'

" Pretty buffer list and bottom bar
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" File tree side bar
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

" Fuzzy file/buf search
Plug 'kien/ctrlp.vim'

" Format JS
Plug 'millermedeiros/vim-esformatter'

" JS comment blocks
Plug 'ddollar/nerdcommenter'

" Fuzzy search
Plug 'mileszs/ack.vim'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Track git line status in gutter
Plug 'airblade/vim-gitgutter'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'

" Run mocha tests inside vim
Plug 'geekjuice/vim-mocha'
Plug 'artemave/spec-index.vim'

" Close all other buffers
Plug 'vim-scripts/BufOnly.vim'
Plug 'fatih/vim-go'
Plug 'mustache/vim-mustache-handlebars'

" Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetsDir = '~/.vim/snippets'
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<C-l>"

" Pytnon PEP8
Plug 'tell-k/vim-autopep8'

" Javascript IntelliSense
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
let g:LanguageClient_autoStart = 1
" Use LanguageServer for omnifunc completion
" autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
" autocmd FileType javascript setlocal completefunc=LanguageClient#complete

" Fuzzy find
Plug 'junegunn/fzf'

" Auto Completion {{{
    " set completeopt-=preview
    " set completeopt=longest,menuone
    " set completeopt=longest,menuone,preview

    Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "context"
    autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    let g:SuperTabClosePreviewOnPopupClose = 1

    " https://fortes.com/2017/language-server-neovim/
    " Plug 'roxma/nvim-completion-manager'
    " Use fuzzy matching
    " let g:cm_matcher = {'case': 'smartcase', 'module': 'cm_matchers.fuzzy_matcher'}

    
    
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

    " https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
    " Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
    " Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

    " https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments

    let g:deoplete#enable_at_startup = 1
    " let g:deoplete#omni#functions = {}
    " let g:deoplete#omni#functions.javascript = [
    " \ 'jspc#omni'
    " \]
    let g:deoplete#sources = {}
    let g:deoplete#sources['javascript'] = ['file', 'ultisnips']
    let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips']
" }}}

Plug 'w0rp/ale'
Plug 'moll/vim-bbye'

" FZF
Plug '/usr/local/opt/fzf'
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
set smarttab " tab respects tabstop shiftwidth and softtabstop
set tabstop=4 " visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftround " round indent to a multiple of 'shiftwidth'
set shiftwidth=4 " number of spaces to use for indent and unindent
set expandtab " insert spaces instead of tabs
set ignorecase    " ignore case when searching
set autoindent    " always set autoindenting on
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
set autoread
set wildmenu " enhanced command line completion
set encoding=UTF8
" set guifont=Hack\ Regular:h13
" set pastetoggle=<F2>
" set timeoutlen=50 ttimeoutlen=0

" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c

" Scroll ahead of the cursor
set so=5

" CtrlP ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules

" Merge vim and OSX clipboards
set clipboard=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly edit/reload the vimrc file
nmap <silent> <leader>cv :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Cycle through buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Close buffer without fucking up nerdtree
nnoremap <leader>q :bp<cr>:bd #<cr>

" Close buffer without closing window (moll/vim-bbye)
nnoremap <leader>w :Bdelete<cr>

" Close buffer *and* window
nnoremap <leader>e :bd<cr>

" Save
nmap <leader>, :w<cr>

nnoremap j gj
nnoremap k gk

" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l
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

" Enter to clear search highlight
nnoremap <CR> :noh<CR><CR>

" ale
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
" let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'java': ['javac'],
\}

" vim-mocha
let g:mocha_js_command = "!mocha --no-colors {spec}"
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" show test spec index
nnoremap <Leader>si :ShowSpecIndex<cr>

" popup menu navigation with hjkl
" inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
" inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

" Load local project directory settings
silent! so .vimlocal

" Automatically wrap descriptions in git commits
autocmd FileType gitcommit set tw=72

" Use silver searcher (ag)
let g:ackprg = 'ag --vimgrep'

" Supertab

" 2 space indent for yaml and ruby
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType rb setlocal ts=2 sts=2 sw=2 expandtab

" Spell check .md files
autocmd BufRead,BufNewFile *.md setlocal spell

" Auto wrap md files
autocmd FileType md setlocal wrap

" auto-dismiss popup preview window

" disable popup preview window

" Project specific editor settings
function! ProjectSettings()
    " smooch-core-js settings
    let smooch_core_js = matchstr(getcwd(), 'git/smooch-core-js')
    if !empty(smooch_core_js)
        let g:ctrlp_custom_ignore = 'lib\|dist\|amd'
        let g:NERDTreeIgnore = ['lib', 'dist', 'amd']
        let g:mocha_js_command = "!mocha --compilers js:babel-core/register --require ./test-setup.js {spec}"
    endif 

    " let smooch_debuggler = matchstr(getcwd(), 'git/smooch-debuggler')
    " if !empty(smooch_debuggler)
    "     let g:ctrlp_custom_ignore = 'lib\|dist\|amd'
    "     let g:NERDTreeIgnore = ['lib', 'dist', 'amd']
    "     let g:mocha_js_command = "!mocha --compilers js:babel-core/register --require ./test-setup.js {spec}"
    " endif 
endfunction

autocmd VimEnter * call ProjectSettings()

" Debug logging
" let g:LanguageClient_loggingLevel = 'DEBUG'

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>z :call LanguageClient_textDocument_documentSymbol()<CR>
