let g:python_host_prog = '/Users/andrew/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/andrew/.pyenv/versions/neovim3/bin/python'

set autoindent          " always set autoindenting on
set autoread
set bs=2 	            " backspace behavior
set clipboard=unnamed   " Merge vim and OSX clipboards
set copyindent          " copy the previous indentation on autoindenting
set encoding=UTF8       " Necessary for 
set expandtab           " insert spaces instead of tabs
set history=1000        " remember more commands and search history
set hlsearch            " highlight search terms
set ignorecase          " ignore case when searching
set incsearch           " show search matches as you type
set mouse=a
set nobackup
set noerrorbells        " don't beep
set noswapfile
set shiftround          " round indent to a multiple of 'shiftwidth'
set shiftwidth=4        " number of spaces to use for indent and unindent
set smarttab 	        " tab respects tabstop shiftwidth and softtabstop
set so=4                " Scroll ahead of the cursor
set softtabstop=4       " edit as if the tabs are 4 characters wide
set tabstop=4 	        " visible width of tabs
set title               " change the terminal's title
set undolevels=1000     " use many muchos levels of undo
set visualbell          " don't beep
set wildignore=*.swp,*.bak,*.pyc,*.class " CtrlP ignore
set wildmenu            " enhanced command line completion
set foldenable
set foldmethod=marker   " fold markers (triple brakcets)

" ensure vim-plug is installed and then load it
call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
   \ 'branch': 'next',
   \ 'do': 'bash install.sh',
   \ }
Plug 'junegunn/fzf'
Plug 'roxma/nvim-completion-manager'
Plug 'joshdick/onedark.vim'
call plug#end()

" Bindings {{{
    " set a map leader for more key combos
    let mapleader = ','
    let maplocalleader = ','
    let g:mapleader = ','

    " Quickly edit/reload the vimrc file
    nmap <silent> <leader>cv :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

    " TAB and Shift-TAB to navigate completion popup
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
" }}}

" LanguageClient-neovim {{{
	let g:LanguageClient_autoStart = 1
	let g:LanguageClient_serverCommands = {
	\ 'javascript': ['javascript-typescript-stdio'],
	\ }

	nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
	nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
	nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
	" <leader>lf to fuzzy find the symbols in the current document
	autocmd FileType javascript nnoremap <buffer>
	  \ <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>
" }}}

" Abbreviations {{{
	abbr funciton function
	abbr teh the
	abbr tempalte template
	abbr fitler filter
	abbr cosnt const
	abbr attribtue attribute
	abbr attribuet attribute
" }}}
"
" Colorscheme {{{
    " colorscheme monokai
    let g:onedark_termcolors=256
    let g:onedark_terminal_italics=1
    colorscheme onedark
    syntax on
    filetype plugin indent on

	" make the highlighting of tabs and other non-text less annoying
	highlight SpecialKey ctermfg=236
	highlight NonText ctermfg=236

	" make comments and HTML attributes italic
	highlight Comment cterm=italic
	highlight htmlArg cterm=italic
	highlight xmlAttrib cterm=italic
	highlight Type cterm=italic
	highlight Normal ctermbg=none
" }}}
"
