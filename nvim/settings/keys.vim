" navigation for autocomplete
inoremap <expr> <c-j> ("\<c-n>")
inoremap <expr> <c-k> ("\<c-p>")
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" use alt + hjkl to resize windows
nnoremap <m-j>    :resize -2<cr>
nnoremap <m-k>    :resize +2<cr>
nnoremap <m-h>    :vertical resize -2<cr>
nnoremap <m-l>    :vertical resize +2<cr>

" save
nnoremap <c-s> :w<cr>
" quit
nnoremap <c-q> :wq!<cr>

" normal mode
inoremap jk <esc>
inoremap kj <esc>

" easy caps
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU<esc>

" tab in general mode will move to text buffer
nnoremap <tab> :bnext<cr>
" shift-tab will go back
nnoremap <s-tab> :bprevious<cr>
nnoremap <c-tab> :bdelete<cr>

" better tabbing
vnoremap < <gv
vnoremap > >gv

" better window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>J
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>L
