set nocompatible 
set background=dark
" set columns=75
set wrapmargin=8
syntax on
set ruler
set tabstop=2
set autoindent
vnoremap < <gv
vnoremap > >gv
set number 
set expandtab
imap <Tab> 

filetype plugin on

" Erlang
let g:erlangHighlightBif=1
let g:erlangHighlightFunHead=1
let g:erlangCompletionGrep = 'zgrep'
let g:erlangManSuffix='erl\.gz'
let g:erlangManPath = '/usr/share/man'
