"settings {{{
    set autoindent          "always set autoindenting on
    set autoread
    set bs=2 	            "backspace behavior
    set clipboard=unnamed   "Merge vim and OSX clipboards
    set completeopt=longest,menuone
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
    set number              "show current line number
    set relativenumber      "show relative line numbers
    set shiftround          "round indent to a multiple of 'shiftwidth'
    set shiftwidth=4        "number of spaces to use for indent and unindent
    set showtabline=2       "show tab line at the top
    set smarttab 	        "tab respects tabstop shiftwidth and softtabstop
    set so=4                "Scroll ahead of the cursor
    set softtabstop=4       "edit as if the tabs are 4 characters wide
    set tabstop=4 	        "visible width of tabs
    set textwidth=120       "automaticlaly add newlines for text longer than 120 cols
    set title               "change the terminal's title
    set undolevels=1000     "use many muchos levels of undo
    set updatetime=750      "speed up gitgutter
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
    Plug 'ctrlpvim/ctrlp.vim'               "fuzzy file search
    Plug 'fatih/vim-go'                     "go vim tools
    Plug 'geekjuice/vim-mocha'              "run mocha tests in vim
    Plug 'haron-prime/evening_vim'          "colorscheme with better diff
    Plug 'heavenshell/vim-jsdoc'            "jsdoc function comments
    Plug 'itchyny/lightline.vim'            "pretty statusbar and tabbar
    Plug 'joshdick/onedark.vim'             "colorscheme
    Plug 'junegunn/fzf.vim'                 "fuzzy file search
    Plug 'kannokanno/previm'                "markdown preview
    Plug 'leafgarland/typescript-vim'       "typescript syntax
    Plug 'mgee/lightline-bufferline'        "tabline buffers for lightline
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
    Plug 'tpope/vim-rhubarb'                "github integration
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
    "inoremap <expr><C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
    "inoremap <expr><C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

    "inoremap jk <esc>

    "enter to clear search highlight
    nnoremap <CR> :noh<CR><CR>

    " scroll the viewport faster
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>

    " Automatically wrap descriptions in git commits
    autocmd FileType gitcommit set textwidth=72

    " Turn wrapping on for markdown and text
    autocmd FileType markdown,text set wrap
    autocmd FileType markdown,text set linebreak

    " Turn textwidth off for markdown and text
    autocmd FileType markdown,text set textwidth=0

    " Set quickfix filetype default
    augroup quickfix
        autocmd!
        autocmd FileType qf setlocal wrap
        autocmd FileType qf setlocal nospell
    augroup END

    " Set filetype to text by defailt
    autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif

    " Turn off spellcheck for certain file types
    " For some reason this doesn't work I have no idea why, so I have the
    " BufEnter shit instead
    " autocmd FileType yaml setlocal nospell
    autocmd BufEnter *.yml setlocal nospell
    autocmd BufEnter *.yaml setlocal nospell
"}}}

"autozimu/LanguageClient-neovim {{{
    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'dockerfile': ['docker-langserver --stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio', '--try-flow-bin --stdio'],
    \ 'python': ['pyls'],
    \ 'go': ['go-langserver'],
    \ }

    "prevent interference with Ack
    let g:LanguageClient_diagnosticsList = "location"

    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
    nnoremap <silent> ga :call LanguageClient_textDocument_codeAction()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    "<leader>lf to fuzzy find the symbols in the current document
    autocmd FileType javascript nnoremap <buffer>
                \ <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>
"}}}

"ctrlpvim/ctrlp.vim {{{
    let g:ctrlp_custom_ignore = 'node_modules'
"}}}

"geekjuice/vim-mocha {{{
    let g:mocha_js_command = "Dispatch mocha --colors {spec}"
    "map <Leader>a :call RunAllSpecs()<CR>
    "map <Leader>t :call RunCurrentSpecFile()<CR>
    map <Leader>s :call RunNearestSpec()<CR>
    map <Leader>l :call RunLastSpec()<CR>
"}}}

"itchyny/lightline.vim {{{
    let g:lightline = {
    \   'colorscheme': 'default',
    \   'active': {
    \     'left':[ [ 'mode' ],
    \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \     ],
    \     'right': [ [ 'lineinfo' ],
    \                [ 'percent' ],
    \                [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ]
    \     ]
    \   },
    \   'component': {
    \     'lineinfo': ' %3l:%-2v',
    \     'charvaluehex': '0x%B',
    \   },
    \   'component_function': {
    \     'gitbranch': 'fugitive#head',
    \   },
    \   'component_expand': {
    \     'buffers': 'lightline#bufferline#buffers',
    \   },
    \   'component_type': {
    \     'buffers': 'tabsel',
    \   }
    \ }

    let g:lightline.separator = {
    \   'left': '', 'right': ''
    \}

    let g:lightline.subseparator = {
    \   'left': '', 'right': ''
    \}

    let g:lightline.tabline = {
    \   'left': [ ['buffers'] ],
    \   'right': [ ['close'] ]
    \ }
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
    let g:ackprg = 'ack --sort-files'
    "if executable('ag')
        "let g:ackprg = 'ag --vimgrep'
    "endif
    
    " Alias Ack! to F
    :command! -nargs=* F Ack! <args>
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
    let g:ale_fix_on_save = 0
    let g:ale_javascript_prettier_use_global = 1

    " ale forces eslint to run against .ts files, but we don't want it to
    let g:ale_javascript_eslint_options = '--ignore-pattern *.ts'

    let g:ale_fixers = {
    \   'javascript': ['prettier'],
    \   'JSON': ['prettier'],
    \   'markdown': ['prettier'],
    \   'python': ['pep-8'],
    \}

    let g:ale_linters = {
    \   'typescript': ['tslint'],
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
    abbr requrie require
    abbr accpet accept
    abbr requset request
"}}}

"language specific settings {{{
    " 2 space indent for yaml and ruby
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType rb setlocal ts=2 sts=2 sw=2 expandtab

    "spell check .md files
    "autocmd BufRead,BufNewFile *.js,*.md setlocal spell
    autocmd FileType markdown,rst,text,yaml,js setlocal spell

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
            let g:NERDTreeIgnore = ['lib', 'dist', 'amd', 'build']
            let g:mocha_js_command = "!mocha --compilers js:babel-core/register --require ./test-setup.js {spec}"
        endif

        " smooch-docs settings
        let smooch_docs = matchstr(getcwd(), 'git/smooch-docs')
        if !empty(smooch_docs)
            let g:ale_fix_on_save = 0
        endif

        " smooch settings
        let smooch = matchstr(getcwd(), 'git/agent-console')
        if !empty(smooch)
            let g:ctrlp_custom_ignore = 'node_modules\|dist\|build'
            let g:NERDTreeIgnore = ['node_modules', 'dist', 'build']
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
    "let g:onedark_termcolors=256
    "let g:onedark_terminal_italics=1
    "colorscheme onedark
    colorscheme evening
    syntax on
    filetype plugin on

    if &diff
        "colorscheme evening
        " Make diff look less awful
        " https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
        highlight! link DiffText MatchParen

        "highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
        "highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
        "highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
        "highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
    endif

    "hi SpellBad ctermfg=www ctermbg=xxx guifg=#yyyyyy guibg=#zzzzzz
    "hi SpellCap ctermfg=www ctermbg=xxx guifg=#yyyyyy guibg=#zzzzzz
    hi SpellBad ctermbg=052 guibg=5f0000
    hi SpellCap ctermbg=236 guibg=303030
    hi Search cterm=NONE ctermfg=NONE ctermbg=058
    
"}}}
