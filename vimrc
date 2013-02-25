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

" Tab completion
imap <Tab> 
set complete=.,b,u,]
set wildmode=longest,list:longest

filetype plugin on

" Erlang
let g:erlangHighlightBif=1
let g:erlangHighlightFunHead=1
let g:erlangCompletionGrep = 'zgrep'
let g:erlangManSuffix='erl\.gz'
let g:erlangManPath = '/usr/share/man'

" Open a file in the current file's path
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>d : <C-R>=expand("%:p:h") . "/" <CR><C-B>
map <Leader>r :r <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>sp :split <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>
