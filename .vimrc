set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'rizzatti/funcoo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-sensible'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-airline/vim-airline'
Plugin 'mkitt/tabline.vim'
Plugin 'vim-scripts/vim-auto-save'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

language en_US.UTF-8
scriptencoding utf-8

syntax enable
highlight LineNr ctermbg=none
highlight MatchParen cterm=bold ctermfg=cyan ctermbg=black
highlight Pmenu ctermbg=238 gui=bold
highlight VertSplit cterm=none
highlight TabLineSel ctermfg=white ctermbg=darkblue cterm=none
highlight TabLineFill term=bold cterm=bold ctermbg=darkgrey


set background=dark
set encoding=utf-8
set t_Co=256
set number
set tabstop=4
set shiftwidth=4
set expandtab
set list
set mouse=a

nnoremap <SPACE> <Nop>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set backupdir=~/.vim/tmp//
set undodir=~/.vim/tmp//
set directory=~/.vim/tmp//

let mapleader="\<space>"

if &diff
    colorscheme diffscheme
endif

let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:nerdtree_tabs_open_on_console_startup=1
let g:airline_powerline_fonts = 1
let g:molokai_original = 1
let NERDTreeShowHidden=1

au VimEnter *.clj RainbowParenthesesToggle
au Syntax *.clj RainbowParenthesesLoadRound
au Syntax *.clj RainbowParenthesesLoadSquare
au Syntax *.clj RainbowParenthesesLoadBrace

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l>   :tabnext<CR>
inoremap <C-h> <Esc>:tabprevious<CR>i
inoremap <C-l>   <Esc>:tabnext<CR>i

nnoremap <silent> <F3> :NERDTreeTabsToggle<CR>
nnoremap <silent> <F4> :set invnumber<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <silent> <F6> :GitGutterToggle<CR>

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 8, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 8, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 8, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 8, 4)<CR>

nmap <leader>d <Plug>FireplaceDtabjump
