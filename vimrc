let mapleader=','
set t_Co=256
syntax enable " Enable syntax processing
set tabstop=4 " Number of spaces per tab (When opening file)
set softtabstop=4 " Number of spaces shown when editing
set expandtab " Converts tabs into spaces
set showcmd " Show command in bottom bar
"set cursorline " Highlights the current line
filetype indent on " Loads filetype specific indent files from ~/.vim/indent/*
set wildmenu " Visual autocomplete for command line
set showmatch " Highlight matching brackets/parentheses/etc
set hls " Highlight search matches
set incsearch " Search as you are typing 
set shiftwidth=4 " Auto indents are 4 spaces
set autoindent " Turn on auto-indent
set smartindent " Smart indent like in VSCode
set relativenumber " Relative line numbers
set backspace=indent,eol,start

" Plugins
call plug#begin('~/.vim/plugs')
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'mhartington/oceanic-next', { 'as': 'OceanicNext' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()

let g:deoplete#enable_at_startup = 1
" Theme 
colorscheme OceanicNext

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:user_emmet_leader_key=','
let g:user_emmet_mode='i'
let g:user_emmet_settings = {
    \'javascript.jsx' : {
        \'extends' : 'jsx',
    \},
\}

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
\}
let g:ale_fix_on_save = 1

" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ }
let g:python3_host_prog = '/usr/bin/python3'


" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#timeout = 1
" Whether to include documentation strings (if found) in the result data.
" Default: 0
" let g:deoplete#sources#ternjs#docs = 1
" Whether to include JavaScript keywords when completing something that is not
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1
"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'js',
                \ 'javascript.jsx',
                \ ]
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

inoremap <silent> <Enter> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function() abort
	  return deoplete#close_popup() . "\<CR>"
  endfunction
