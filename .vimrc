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
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-sensible'

Plugin 'jistr/vim-nerdtree-tabs'

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

syntax on

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
highlight Pmenu ctermbg=238 gui=bold

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
nmap <silent> <F3> :NERDTreeTabsToggle<CR>
nmap <silent> <F4> :set invnumber<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set backupdir=~/.vim/tmp//
set undodir=~/.vim/tmp//
set directory=~/.vim/tmp//

if &diff
    colorscheme diffscheme
endif

set langmenu=en_US.UTF-8 " gvim menus, just in case
language en_US.UTF-8

au BufRead,BufNewFile Vagrantfile if &ft == '' | setfiletype ruby | endif
au BufRead,BufNewFile ansible_hosts if &ft == '' | setfiletype ini | endif

let g:nerdtree_tabs_open_on_console_startup=1

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

