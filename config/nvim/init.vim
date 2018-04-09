"settings {{{
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
"}}}

"plugins {{{
    let g:python_host_prog = '/Users/andrew/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = '/Users/andrew/.pyenv/versions/neovim3/bin/python'

    call plug#begin()
    Plug 'artemave/spec-index.vim'          "test outline
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }                                 "javascript intellisense
    Plug 'bling/vim-airline'                "pretty statusbar and tabbar
    Plug 'millermedeiros/vim-esformatter'   "js formatter
    Plug 'geekjuice/vim-mocha'              "run mocha tests in vim
    Plug 'joshdick/onedark.vim'             "colorscheme
    Plug 'junegunn/fzf'                     "fuzzy file search
    Plug 'mileszs/ack.vim'                  "fuzzy file content search
    Plug 'roxma/nvim-completion-manager'    "better than <C-X><C-O>
    Plug 'ryanoasis/vim-devicons'           "icons next to filenames
    Plug 'tpope/vim-fugitive'               "git inside vim
    Plug 'tpope/vim-repeat'                 "make more mappings repeatable with .
    Plug 'tpope/vim-surround'               "ysiw' to wrap in '
    Plug 'tpope/vim-unimpaired'             "mappings like ]q [q for :cnext :cpref
    Plug 'scrooloose/nerdcommenter'         "jsdoc comment blocks
    Plug 'scrooloose/nerdtree', {
        \ 'on': ['NERDTreeToggle',
        \        'NERDTreeFind']
        \ }                                 "file browser sidebar
    Plug 'vim-scripts/BufOnly.vim'          "close all other buffers
    call plug#end()
"}}}

"mappings {{{
    "map leader for more commands
    let mapleader = ','
    let maplocalleader = ','
    let g:mapleader = ','

    "artemave/spec-index.vim
    nnoremap <Leader>si :ShowSpecIndex<cr>

    "junegunn/fzf
    nnoremap <C-p> :FZF<cr>

    "millermedeiros/esformatter
    map <leader>f :Esformatter<CR>

    "scrooloose/nerdcommenter
    noremap <leader>/ :call NERDComment(0,"toggle")<CR>

    "vim-scripts/BufOnly.vim
    nmap <silent><leader>W :BufOnly<CR>

    "quickly edit/reload the vimrc file
    nmap <silent> <leader>cv :e $MYVIMRC<cr>
    nmap <silent> <leader>sv :so $MYVIMRC<cr>
    nmap <silent> <leader>pi :so $MYVIMRC<cr>:PlugInstall<cr>

    "popup menu navigation
    inoremap <expr><TAB> pumvisible() ? "\<C-n>": "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>": "\<S-TAB>"
    inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
    inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

    inoremap jk <esc>

    "enter to clear search highlight
    nnoremap <CR> :noh<CR><CR>

    " scroll the viewport faster
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>

    " Automatically wrap descriptions in git commits
    autocmd FileType gitcommit set tw=72
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

"geekjuice/vim-mocha {{{
    let g:mocha_js_command = "!mocha --no-colors {spec}"
    map <Leader>a :call RunAllSpecs()<CR>
    map <Leader>t :call RunCurrentSpecFile()<CR>
    map <Leader>s :call RunNearestSpec()<CR>
    map <Leader>l :call RunLastSpec()<CR>
"}}}

"mileszs/ack.vim {{{
    if executable('ag')
        let g:ackprg = 'ag --vimgrep'
    endif
"}}}

"scrooloose/nerdtree {{{
    function! ToggleNerdTree()
        if @% != "" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
            :NERDTreeFind
        else
            :NERDTreeToggle
        endif
    endfunction

    noremap <C-n> :NERDTreeToggle<cr>
    nmap <silent> <leader>f :NERDTreeFind<cr>
"}}}

"abbreviations {{{
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute
"}}}

"language specific settings {{{
    " 2 space indent for yaml and ruby
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType rb setlocal ts=2 sts=2 sw=2 expandtab

    "spell check .md files
    autocmd BufRead,BufNewFile *.md setlocal spell

    " Auto wrap md files
    autocmd FileType md setlocal wrap

    "spell check dictionary
    if filereadable("/usr/share/dict/words")
        set dictionary+=/usr/share/dict/words
    endif
"}}}

"project specific settings {{{
    function! ProjectSettings()
        " smooch-core-js settings
        let smooch_core_js = matchstr(getcwd(), 'git/smooch-core-js')
        if !empty(smooch_core_js)
            let g:ctrlp_custom_ignore = 'lib\|dist\|amd'
            let g:NERDTreeIgnore = ['lib', 'dist', 'amd']
            let g:mocha_js_command = "!mocha --compilers js:babel-core/register --require ./test-setup.js {spec}"
        endif


        let smooch = matchstr(getcwd(), 'git/smooch')
        if !empty(smooch_core_js)
        endif

        " let smooch_debuggler = matchstr(getcwd(), 'git/smooch-debuggler')
        " if !empty(smooch_debuggler)
        "     let g:ctrlp_custom_ignore = 'lib\|dist\|amd'
        "     let g:NERDTreeIgnore = ['lib', 'dist', 'amd']
        "     let g:mocha_js_command = "!mocha --compilers js:babel-core/register --require ./test-setup.js {spec}"
        " endif
    endfunction

    autocmd VimEnter * call ProjectSettings()
"}}}

"colorscheme {{{
    "colorscheme monokai
    let g:onedark_termcolors=256
    let g:onedark_terminal_italics=1
    colorscheme onedark
    syntax on
    filetype plugin on
"}}}
