" phpactor
autocmd FileType php setlocal omnifunc=phpactor#Complete

" This use a global install of PHPActor and not the Vim plugin for even more configuration possibilities

" general context meneu
autocmd FileType php nnoremap <leader>rmm :call phpactor#ContextMenu()<cr>

" lookup definitions
autocmd FileType php nnoremap <leader>rlr :call phpactor#FindReferences()<cr>

" Fill
" constructor
autocmd FileType php nnoremap <leader>rfc :call PHPModify("complete_constructor")<cr>
" interface
autocmd FileType php nnoremap <leader>rfi :call PHPModify("implement_contracts")<cr>
" properties
autocmd FileType php nnoremap <leader>rfp :call PHPModify("add_missing_properties")<cr>

" Extract
autocmd FileType php nnoremap <leader>rei :call phpactor#ClassInflect()<cr>
autocmd FileType php nnoremap <leader>reu :call phpactor#UseAdd()<cr>
autocmd FileType php vnoremap <leader>rem :call phpactor#ExtractMethod()<cr>

" go to definition of a method / class / whatever via Ctags
autocmd FileType php map <leader>] :call phpactor#GotoDefinition()<CR>

function! PHPModify(transformer)
    normal! ggdG
    execute "read !phpactor class:transform ".expand('%').' --transform='.a:transformer
    normal! ggdd
endfunction
