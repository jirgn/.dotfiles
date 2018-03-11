" FZF
let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <leader>t :GFiles<cr>
else
    " otherwise, use :FZF
    nmap <silent> <leader>t :FZF<cr>
endif

nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" ripgrep to FZF
nnoremap <leader>a :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

" autocommand for Rg usage in FZF
" use ? to show preview
" HINT use .rgignore to override .gitingore if you want to include see
" https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#automatic-filtering
command! -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --fixed-strings --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)


