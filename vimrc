
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
 set tabstop=8 shiftwidth=8
 autocmd FileType vim     set expandtab
 autocmd FileType haskell set tabstop=4 shiftwidth=4 expandtab
 autocmd FileType html    set tabstop=2 shiftwidth=2 expandtab
 autocmd FileType xml     set tabstop=2 shiftwidth=2 expandtab
 autocmd FileType xhtml   set tabstop=2 shiftwidth=2 expandtab
 autocmd FileType css     set tabstop=4 shiftwidth=4 expandtab
 autocmd FileType scss    set tabstop=4 shiftwidth=4 expandtab
 autocmd FileType python  set tabstop=4 shiftwidth=4 expandtab
