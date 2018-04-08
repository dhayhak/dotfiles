let g:python_host_prog = '/Users/andrew/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/andrew/.pyenv/versions/neovim3/bin/python'

set autoindent          "always set autoindenting on
set autoread
set bs=2 	            "backspace behavior
set clipboard=unnamed   "Merge vim and OSX clipboards
set copyindent          "copy the previous indentation on autoindenting
set encoding=UTF8       "vim-devicons needs this
set expandtab           "insert spaces instead of tabs
set foldenable
set foldmethod=marker   "fold markers (triple brakcets)
set hidden              "allow hidden buffers
set history=1000        "remember more commands and search history
set hlsearch            "highlight search terms
set ignorecase          "ignore case when searching
set incsearch           "show search matches as you type
set mouse=a             "mouse in vim
set nobackup
set noerrorbells        "don't beep
set noswapfile
set number              "show line numbers
set shiftround          "round indent to a multiple of 'shiftwidth'
set shiftwidth=4        "number of spaces to use for indent and unindent
set smarttab 	        "tab respects tabstop shiftwidth and softtabstop
set so=4                "Scroll ahead of the cursor
set softtabstop=4       "edit as if the tabs are 4 characters wide
set tabstop=4 	        "visible width of tabs
set textwidth=120       "
set title               "change the terminal's title
set undolevels=1000     "use many muchos levels of undo
set visualbell          "don't beep
set wildignore=*.swp,*.bak,*.pyc,*.class "CtrlP ignore
set wildmenu            "enhanced command line completion
set wildmode=list:longest " complete files like a shell

"ensure vim-plug is installed and then load it
call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
   \ 'branch': 'next',
   \ 'do': 'bash install.sh',
   \ }                                  "javascript intellisense
Plug 'bling/vim-airline'
Plug 'joshdick/onedark.vim'             "colorscheme
Plug 'junegunn/fzf'                     "fuzzy search
Plug 'roxma/nvim-completion-manager'    "better than <C-X><C-O>
Plug 'tpope/vim-fugitive'               "git inside vim
Plug 'tpope/vim-repeat'                 "make more mappings repeatable with .
Plug 'tpope/vim-surround'               "ysiw' to wrap in '
Plug 'tpope/vim-unimpaired'             "mappings like ]q [q for :cnext :cpref
Plug 'scrooloose/nerdtree', {
    \ 'on': ['NERDTreeToggle',
    \        'NERDTreeFind']
    \ }                                 "file browser sidebar
Plug 'vim-scripts/BufOnly.vim'          "close all other buffers
call plug#end()

"mappings {{{
    "map leader for more commands
    let mapleader = ','
    let maplocalleader = ','
    let g:mapleader = ','

    "quickly edit/reload the vimrc file
    nmap <silent> <leader>cv :e $MYVIMRC<cr>
    nmap <silent> <leader>sv :so $MYVIMRC<cr>
    nmap <silent> <leader>pi :so $MYVIMRC<cr>:PlugInstall<cr>

    "tab and shift-tab to navigate completion popup
    inoremap <expr><TAB> pumvisible() ? "\<C-n>": "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>": "\<TAB>"

    nnoremap <C-p> :FZF<cr>

    inoremap jk <esc>

    "enter to clear search highlight
    nnoremap <CR> :noh<CR><CR>

    "close all other buffers
    nmap <slient> <leader>W :BufOnly<CR>
"}}}

"autozimu/LanguageClient-neovim {{{
    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }

    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    "<leader>lf to fuzzy find the symbols in the current document
    autocmd FileType javascript nnoremap <buffer>
                \ <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>
"}}}

"bling/vim-airline {{{
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
"}}}

" scrooloose/nerdtree {{{
    function! ToggleNerdTree()
        if @% != "" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
            :NERDTreeFind
        else
            :NERDTreeToggle
        endif
    endfunction

    noremap <C-n> :NERDTreeToggle<cr>
    nmap <silent> <leader>f :NERDTreeFind<cr>
" }}}

"abbreviations {{{
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute
"}}}

"colorscheme {{{
    "colorscheme monokai
    let g:onedark_termcolors=256
    let g:onedark_terminal_italics=1
    colorscheme onedark
    syntax on
    filetype plugin indent on
"}}}
