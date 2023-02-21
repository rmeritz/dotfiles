" load vim configs
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" use Vundle for packages
if filereadable(stdpath('config') . '/vundles.vim')
  filetype off

  exec "set runtimepath+=" . stdpath('config') . '/bundle/Vundle.vim'
  call vundle#begin()
  Bundle 'VundleVim/Vundle.vim'
  exec "source " . stdpath('config') . '/vundles.vim'
  call vundle#end()

  filetype plugin indent on
endif

let configs = split(glob("~/.vim/configs/*"), "\n")
for filename in configs
  execute 'source ' filename
endfor
