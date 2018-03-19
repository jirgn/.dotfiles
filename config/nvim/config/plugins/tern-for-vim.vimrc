" tern-for-vim
let g:tern#filetypes = [
    \ 'jsx',
    \ 'javascript.jsx'
    \ ]
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_map_keys = 0
let g:tern_map_prefix = 0
let g:tern_show_signature_in_pum = 1
let g:tern_show_loc_after_rename = 1
let g:tern_show_argument_hints = 'on_hold'

" lookup
autocmd FileType javascript nnoremap <leader>rlr :TernRefs<cr>
autocmd FileType javascript.jsx nnoremap <leader>rlr :TernRefs<cr>
autocmd FileType javascript nnoremap <leader>rld :TernDoc<cr>
autocmd FileType javascript.jsx nnoremap <leader>rld :TernDoc<cr>

" rename
autocmd FileType javascript nnoremap <leader>rrr :TernRename<cr>
autocmd FileType javascript.jsx nnoremap <leader>rrr :TernRename<cr>

" go to definition of a method / class / whatever via Ctags
autocmd FileType javascript map <leader>] :TernDef<CR>
autocmd FileType javascript.jsx map <leader>] :TernDef<CR>
