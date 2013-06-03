set background=dark
set ruler
set tabstop=4
set autoindent
set number 
set expandtab

" Tab completion
set complete=.,b,u,]
set wildmode=longest,list:longest

" Syntax highlighting
syntax on

" Open a file in the current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
