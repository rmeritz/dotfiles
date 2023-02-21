Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'AndrewRadev/splitjoin.vim'

" This block is copied from ~/.vim/vundles
Plugin 'tpope/vim-unimpaired'
Plugin 'mmozuras/vim-whitespace'
Plugin 'vim-ruby/vim-ruby'
Plugin 'DataWraith/auto_mkdir'
Plugin 'tpope/vim-fugitive'
Plugin 'epmatsw/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jgdavey/vim-blockle'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-repeat'
Plugin 'mgamba/j-split'
Plugin 'vim-airline/vim-airline'
Plugin 'kopischke/vim-fetch'
Plugin 'vim-scripts/django.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'

if executable('rails')
  Bundle 'tpope/vim-rails'
  Bundle 'jparise/vim-graphql'
endif

if executable('ruby')
  Bundle 'bigloser/vim-ruby-cute'
endif

if executable('rustup') || executable('solargraph')
  Bundle 'neovim/nvim-lspconfig'
endif
