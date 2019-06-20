set t_Co=256
set background=dark
colorscheme PaperColor
syntax enable " Enable syntax processing
set tabstop=4 " Number of spaces per tab (When opening file)
set softtabstop=4 " Number of spaces shown when editing
set expandtab " Converts tabs into spaces
set showcmd " Show command in bottom bar
set cursorline " Highlights the current line
filetype indent on " Loads filetype specific indent files from ~/.vim/indent/*
set wildmenu " Visual autocomplete for command line
set showmatch " Highlight matching brackets/parentheses/etc
set hls " Highlight search matches
set incsearch " Search as you are typing 
set shiftwidth=4 " Auto indents are 4 spaces
set autoindent " Turn on auto-indent
set smartindent " Smart indent like in VSCode
set relativenumber " Relative line numbers


" Plugins
call plug#begin('~/.vim/plugs')
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
call plug#end()

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
        \'javascript.jsx' : {
            \'extends' : 'jsx',
        \},
    \}


