set background=dark
set ruler
set number
set autoindent
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

" Better Buffer handling
set hidden
set wildchar=<Tab> wildmenu wildmode=full
let g:switchbuf="useopen,usetab"

" Tab completion
set complete=.,b,u,]
set wildmode=longest,list:longest

" Syntax highlighting
syntax on

" Open a file in the current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Vundles for package management
" RUN: :BundleInstall
source ~/.vim/vundle

" Syntastic (Flymake for vim)
" RUN: pip install flake8
let g:syntastic_error_symbol='✗✗'
let g:syntastic_warning_symbol='⚠⚠'
let g:syntastic_ignore_files=['__init__.py']
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticWarningSign guifg=white guibg=blue

" Python Settings
let g:syntastic_python_checkers=['flake8']
