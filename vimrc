set t_Co=256
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'mhartington/oceanic-next', { 'as': 'OceanicNext' }
call plug#end()
"
" Theme 
syntax enable
if (has("termguicolors"))
    set termguicolors
endif

colorscheme OceanicNext


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


