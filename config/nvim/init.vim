call plug#begin()
" Javascript IntelliSense
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" let g:LanguageClient_autoStart = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.javascript = [
" \ 'jspc#omni'
" \ 'LanguageClient#complete'
" \]
let g:deoplete#sources = {}
let g:deoplete#sources['javascript'] = ['file']
let g:deoplete#sources['javascript.jsx'] = ['file']
call plug#end()
