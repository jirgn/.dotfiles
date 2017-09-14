" vim:fdm=marker

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = [ 'eslint' ]
let g:neomake_jsx_enabled_makers = [ 'eslint' ]
let g:neomake_php_enabled_makers = [ 'php', 'phpmd', 'phpcs' ]
let g:neomake_php_phpcs_args_standard = 'PSR2'
let g:neomake_puppet_enabled_makers = [ 'puppetlint' ]

" NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>
let NERDTreeShowHidden=1

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

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric//YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " UltiSnipsEdit to split your window.

" vim-marked 
let g:marked_app = "Marked"

" Fugitive
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

" vim-jsx 
let g:jsx_ext_required = 0 " enable jsx for all js files

" vim-javascript
let g:javascript_plugin_jsdoc = 1

"vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
nmap <silent> <c-d> <Plug>(jsdoc)

" deoplete autocompletion
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:tern_request_timeout = 1
let g:deoplete#file#enable_buffer_path = 1

" let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" tern-for-vim
let g:tern#filetypes = [
    \ 'jsx',
    \ 'javascript.jsx'
    \ ]
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='gruvbox'
let g:airline#extensions#tagbar#enabled = 0 " enable airline tabline
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" vim-debug
let g:vdebug_options = { 'server': '127.0.0.1', 'port': '9000' }

" vim-maximizer
let g:maximizer_set_default_mapping = 1
let g:maximizer_default_mapping_key = '<leader>z'

" gutentags
let g:gutentags_ctags_tagfile = '.tags'
" let g:gutentags_ctags_executable_javascript = 'jsctags'
" let g:gutentags_project_info = [
"     \{'type': 'python', 'file': 'setup.py'},
"     \{'type': 'ruby', 'file': 'Gemfile'},
"     \{'type': 'javascript', 'file': 'package.json'},
"     \{'type': 'php', 'file': 'composer.json'}
" \]

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

