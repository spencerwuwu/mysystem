"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Bundle (Vundle)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible	" required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugins:

" Utility
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'urso/haskell_syntax.vim'
Plugin 'xhtml.vim'
Plugin 'gabrielelana/vim-markdown'
Plugin 'python.vim'
" Indent
Plugin 'indentpython.vim'

Plugin 'slim-template/vim-slim.git'

" scripts on GitHub repos
"Plugin 'tpope/vim-rails.git'
" scripts from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required
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
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/bash
set history=500
filetype on
filetype plugin on
filetype indent on
set autoread
set autochdir
set noswapfile
noremap <F4> :set hlsearch! hlsearch?<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=5
set nu
set wrap
set wildmenu
set ruler
set lazyredraw
set nostartofline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, Fonts and Encodings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
colorscheme desert
set encoding=utf8
set fileencodings=utf8,utf16,big5,gbk,latin1
set ffs=unix,dos,mac
nmap u8  :set fileencoding=utf-8<CR>:w<CR>
nmap ffu :set ff=unix<CR>:w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set pastetoggle=<F7>
set smarttab
set cindent
set autoindent
set smartindent
set tabstop=4 shiftwidth=4
set expandtab
autocmd FileType vim     set expandtab
autocmd FileType haskell set tabstop=4 shiftwidth=4 expandtab
autocmd FileType c       set tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp     set tabstop=4 shiftwidth=4 expandtab
autocmd FileType ruby    set tabstop=2 shiftwidth=2 expandtab
autocmd FileType eruby   set tabstop=2 shiftwidth=2 expandtab
autocmd FileType html    set tabstop=2 shiftwidth=2 expandtab
autocmd FileType js      set tabstop=2 shiftwidth=2 expandtab
autocmd FileType xml     set tabstop=2 shiftwidth=2 expandtab
autocmd FileType xhtml   set tabstop=2 shiftwidth=2 expandtab
autocmd FileType css     set tabstop=4 shiftwidth=4 expandtab
autocmd FileType scss    set tabstop=2 shiftwidth=2 expandtab
autocmd FileType python  set tabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab
autocmd FileType coffeescript set tabstop=2 shiftwidth=2 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
" map <F4> :! gdb -q %:r<CR>
map <F5> :! valgrind --leak-check=full ./%:r<CR>
nmap r :!<Space>
nmap tt :tabedit<Space>
nmap td :tabclose<CR>
nmap tl :tabnext<CR>
nmap th :tabprev<CR>
" autocmd: comment
autocmd FileType c       nmap <F9> I//<esc>jh
autocmd FileType c       nmap <F8> ^2xj
autocmd FileType c       nmap <S-F9> I//<esc>kh
autocmd FileType c       nmap <S-F8> ^2xk
autocmd FileType cpp     nmap <F9> I//<esc>jh
autocmd FileType cpp     nmap <F8> ^2xj
autocmd FileType cpp     nmap <S-F9> I//<esc>kh
autocmd FileType cpp     nmap <S-F8> ^2xk
autocmd FileType java    nmap <F9> I//<esc>jh
autocmd FileType java    nmap <F8> ^2xj
autocmd FileType java    nmap <S-F9> I//<esc>kh
autocmd FileType java    nmap <S-F8> ^2xk
autocmd FileType vim     nmap <F9> I"<esc>j
autocmd FileType vim     nmap <F8> ^xj
autocmd FileType vim     nmap <S-F9> I"<esc>k
autocmd FileType vim     nmap <S-F8> ^xk
autocmd FileType sh      nmap <F9> I#<esc>j
autocmd FileType sh      nmap <F8> ^xj
autocmd FileType sh      nmap <S-F9> I#<esc>k
autocmd FileType sh      nmap <S-F8> ^xk
autocmd FileType conf    nmap <F9> I#<esc>j
autocmd FileType conf    nmap <F8> ^xj
autocmd FileType conf    nmap <S-F9> I#<esc>k
autocmd FileType conf    nmap <S-F8> ^xk
autocmd FileType python  nmap <F9> I#<esc>j
autocmd FileType python  nmap <F8> ^xj
autocmd FileType python  nmap <S-F9> I#<esc>k
autocmd FileType python  nmap <S-F8> ^xk
autocmd FileType haskell nmap <F9> I--<esc>jh
autocmd FileType haskell nmap <F8> ^2xj
autocmd FileType haskell nmap <S-F9> I--<esc>kh
autocmd FileType haskell nmap <S-F8> ^2xk
" autocmd: compile
" autocmd FileType c      nmap <C-c> :! gcc % -o %:r -Wall -Wextra -Wpedantic -O2 -ansi<CR>
" autocmd FileType cpp    nmap <C-c> :! g++ % -o %:r -Wall -Wextra -Wpedantic -O2 -std=c++11<CR>
autocmd FileType java   nmap <C-c> :! javac %<CR>
" autocmd: execute
autocmd FileType c      nmap <C-x> :! ./%:r<CR>
autocmd FileType cpp    nmap <C-x> :! ./%:r<CR>
autocmd FileType java   nmap <C-x> :! java %:r<CR>
