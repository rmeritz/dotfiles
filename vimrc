" Set up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vim/vundles
call vundle#end()
filetype plugin indent on

" Read in additional configurations
let configs = split(glob("~/.vim/configs/*"), "\n")
for filename in configs
  execute 'source ' filename
endfor
