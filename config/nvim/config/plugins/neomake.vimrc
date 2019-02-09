" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_javascript_enabled_makers = [ 'eslint' ]
let g:neomake_jsx_enabled_makers = [ 'eslint' ]
let g:neomake_php_enabled_makers = [ 'php', 'phpmd', 'phpcs', 'phpstan']
let g:neomake_php_phpcs_args_standard = 'PSR2'
let g:neomake_puppet_enabled_makers = [ 'puppetlint' ]
let g:neomake_elixir_enabled_makers = [ 'elixir', 'credo' ]
