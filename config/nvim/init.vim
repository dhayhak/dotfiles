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
    set nocompatible
    set noerrorbells        "don't beep
    set noswapfile
    set nowrap              "turn off line wrapping
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
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules "CtrlP
    set wildmenu            "enhanced command line completion
    set wildmode=list:longest " complete files like a shell
"}}}

"plugins {{{
    let g:python_host_prog = '/Users/andrew/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = '/Users/andrew/.pyenv/versions/neovim3/bin/python'

    call plug#begin()

    Plug 'airblade/vim-gitgutter'           "git status in the gutter
    Plug 'artemave/spec-index.vim'          "test outline
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }                                 "javascript intellisense
    Plug 'bling/vim-airline'                "pretty statusbar and tabbar
    Plug 'ctrlpvim/ctrlp.vim'               "fuzzy file search
    Plug 'fatih/vim-go'                     "go vim tools
    Plug 'geekjuice/vim-mocha'              "run mocha tests in vim
    Plug 'heavenshell/vim-jsdoc'            "jsdoc function comments
    Plug 'joshdick/onedark.vim'             "colorscheme
    Plug 'junegunn/fzf.vim'                 "fuzzy file search
    Plug 'kannokanno/previm'                "markdown preview
    Plug 'mileszs/ack.vim'                  "fuzzy file content search
    Plug 'millermedeiros/vim-esformatter'   "js formatter
    Plug 'moll/vim-bbye'                    "close
    Plug 'mustache/vim-mustache-handlebars' "mustache handlebars syntax
    Plug 'othree/yajs.vim'                  "javascript syntax
    Plug 'roxma/nvim-completion-manager'    "better than <C-X><C-O>
    Plug 'ryanoasis/vim-devicons'           "icons next to filenames
    Plug 'tell-k/vim-autopep8'              "python formatter
    Plug 'tpope/vim-dispatch'               "let ack run independently
    Plug 'tpope/vim-fugitive'               "git inside vim
    Plug 'tpope/vim-repeat'                 "make more mappings repeatable with .
    Plug 'tpope/vim-surround'               "ysiw' to wrap in '
    Plug 'tpope/vim-unimpaired'             "mappings like ]q [q for :cnext :cpref
    Plug 'scrooloose/nerdcommenter'         "jsdoc comment blocks
    Plug 'scrooloose/nerdtree', {
        \ 'on': ['NERDTreeToggle',
        \        'NERDTreeFind']
        \ }                                 "file browser sidebar
    Plug 'SirVer/ultisnips'                 "snippets
    Plug 'vim-scripts/BufOnly.vim'          "close all other buffers
    Plug 'w0rp/ale'                         "linter
    call plug#end()
"}}}

" functions {{{
    function! QuickfixToggle()
        let nr = winnr("$")
        copen 10
        let nr2 = winnr("$")
        if nr == nr2
            cclose 10
        endif
    endfunction
"}}}

"mappings {{{
    "map leader for more commands
    let mapleader = ','
    let maplocalleader = ','
    let g:mapleader = ','

    "artemave/spec-index.vim
    nnoremap <Leader>si :ShowSpecIndex<cr>

    "millermedeiros/esformatter
    map <leader>f :Esformatter<CR>

    "moll/vim-bbye close buffer without closing window
    nnoremap <leader>w :Bdelete<cr>

    "scrooloose/nerdcommenter
    noremap <leader>/ :call NERDComment(0,"toggle")<CR>

    "vim-scripts/BufOnly.vim
    nmap <silent><leader>W :BufOnly<CR>

    " save
    nmap <leader>, :w<cr>

    "quickly edit/reload the vimrc file
    nmap <silent> <leader>cv :e $MYVIMRC<cr>
    nmap <silent> <leader>sv :so $MYVIMRC<cr>
    nmap <silent> <leader>pi :so $MYVIMRC<cr>:PlugInstall<cr>

    "toggle and grow quickfix
    noremap <leader>q :copen 40<cr>
    noremap <leader>a :copen 10<cr>
    noremap <leader>z :call QuickfixToggle()<cr>

    "cusor behave with wrapped lines
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk

    " Cycle through buffers
    :nnoremap <Tab> :bnext<CR>
    :nnoremap <S-Tab> :bprevious<CR>


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

    " Turn wrapping on for markdown
    autocmd FileType markdown set wrap
    autocmd FileType markdown set linebreak
"}}}

"autozimu/LanguageClient-neovim {{{
    "let g:LanguageClient_autoStart = 1
    let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }

    "prevent interference with Ack
    let g:LanguageClient_diagnosticsList = "location"

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
    let g:mocha_js_command = "Dispatch mocha --colors {spec}"
    "map <Leader>a :call RunAllSpecs()<CR>
    "map <Leader>t :call RunCurrentSpecFile()<CR>
    map <Leader>s :call RunNearestSpec()<CR>
    map <Leader>l :call RunLastSpec()<CR>
"}}}

"junegunn/fzf{{{
    "nnoremap <C-p> :FZF<cr>
    "let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"}}}

"kannokanno/previm{{{
    let g:previm_open_cmd = 'open -a Google\ Chrome'
    augroup PrevimSettings
        autocmd!
        autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    augroup END
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
    nmap <silent> <leader>t :NERDTreeFind<cr>
"}}}

"SirVer/ultisnips {{{
    let g:UltiSnipsExpandTrigger="<C-j>"
    let g:UltiSnipsListSnippets="<C-l>"
    let g:UltiSnipsJumpForwardTrigger="<C-l>"
    let g:UltiSnipsJumpBackwardTrigger="<C-h>"
"}}}

"w0rp/ale {{{
    "let g:ale_fix_on_save = 1
    let g:ale_fixers = {
    \   'javascript': ['eslint'],
    \}

    let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'java': ['javac'],
    \}
"}}}

"abbreviations {{{
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute
    abbr toSTring toString
"}}}

"language specific settings {{{
    " 2 space indent for yaml and ruby
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType rb setlocal ts=2 sts=2 sw=2 expandtab

    "spell check .md files
    autocmd BufRead,BufNewFile *.md setlocal spell

    "spell check dictionary
    if filereadable("/usr/share/dict/words")
        set dictionary+=/usr/share/dict/words
    endif
"}}}

"project specific settings {{{
    "load local project directory settings
    silent! so .vimlocal

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
