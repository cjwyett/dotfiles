colorscheme nord

autocmd FileType latex,tex,md,markdown setlocal spell spelllang=en_gb
set spellfile=$HOME/.config/nvim/settings/spellings.utf-8.add
set shortmess+=c
set hidden
set foldmethod=syntax
set cmdheight=2
set updatetime=300
set timeoutlen=500
set linebreak
set nocompatible 
set number relativenumber
set nowrap
set background=dark
set smarttab
set autoindent
set smartindent
set expandtab
set splitright
set splitbelow
set fileencoding=utf-8
set nobackup
set nowritebackup
set tabstop=4
set showtabline=2 
set formatoptions-=cro 
set iskeyword+=-
set conceallevel=0

if has("autocmd")
  filetype plugin indent on
endif

" You can't stop me
cmap w!! w !sudo tee %
