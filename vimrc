" Read in additional configurations
let configs = split(glob("~/.vim/configs/*"), "\n")
for filename in configs
  execute 'source ' filename
endfor
