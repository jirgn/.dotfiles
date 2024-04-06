" vim:fdm=marker

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

" reducing number of lines in viminfo file -- fixing slow startup times
if (has('nvim'))
  set shada='20,<50,s10
else
  set viminfo='20,<50,s10
endif

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed
set history=1000            " change history to 1000

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" set python paths for plugins depending on python to work
let g:python3_host_prog = "/usr/bin/python"
let g:vimsyn_embed = "l"


"{{{ Mappings }}}
"""""""""""""""""""""""""""""""""""

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
nnoremap <silent> $ g$

nnoremap <leader>xk <cmd>lua vim.diagnostic.open_float()<CR>

