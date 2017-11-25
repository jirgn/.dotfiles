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
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %

    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    " markdown
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']
    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

    " confluence
    autocmd BufNewFile,BufReadPost *.confluence set filetype=confluencewiki

    " neos
    autocmd BufNewFile,BufReadPost *.fusion set filetype=typoscript

    " fix some issues with puppet and ruby
    if v:version >= 703
        " Note: Relative number is quite slow with Ruby, so is cursorline
        autocmd FileType ruby setlocal norelativenumber nocursorline regexpengine=1 foldmethod=manual lazyredraw
    endif

    " puppet-commentary
    autocmd FileType puppet setlocal commentstring=#\ %s
augroup END
