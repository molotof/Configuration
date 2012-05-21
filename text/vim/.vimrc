"colorscheme anotherdark

set autoindent
set backspace=indent,eol,start
set expandtab
set formatoptions=1
set grepprg=grep\ -nH\ $*
set history=50
set hlsearch
set ignorecase
set incsearch
set lbr
set mouse=a
set nobackup
set nocompatible
set nostartofline
set number
set pastetoggle=<F2>
set ruler
set scrolloff=1
set shiftwidth=4
set showcmd
set smartcase
set smarttab
set tabstop=4
set tags+=$HOME/.vim/tags/python.ctags
set t_Co=256
set virtualedit=block
set whichwrap=b,s,[,],<,>,h,l
set wrap
set colorcolumn=80
set textwidth=80

syntax on
filetype plugin indent on
autocmd BufWritePre * :%s/\s\+$//e
augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=80
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \ 	exe "normal! g`\"" |
                \ endif
augroup END

