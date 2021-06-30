" vim:fdm=marker

" set a map leader for more key combos
let mapleader = ','

" shortcut to save
nmap <leader>, :w<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" shortcut to redraw current window
nnoremap <leader>rd :redraw!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> gj j
nnoremap <silent> k gk
nnoremap <silent> gk k
nnoremap <silent> ^ g^
nnoremap <silent> g^ ^
nnoremap <silent> $ g$
nnoremap <silent> g$ $
