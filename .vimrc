execute pathogen#infect()
syntax on
filetype plugin indent on

scriptencoding utf-8

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set encoding=utf-8
set t_Co=256
set number
set tabstop=4
set shiftwidth=4
set expandtab
set list

highlight MatchParen cterm=bold ctermfg=cyan ctermbg=black

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <silent> <F3> :NERDTreeToggle<CR>
