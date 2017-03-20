" vim:fdm=marker

source ~/.config/nvim/plugins.vim

" Section General {{{

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

set shada='20,<50,s10       " reducing number of lines in viminfo file -- fixing slow startup times

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed

set history=1000            " change history to 1000
set textwidth=120

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" }}}

" Section User Interface {{{

" enable 24 bit color support if supported
if (has("termguicolors"))
    set termguicolors
endif

set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"
colorscheme dracula         " Set the colorscheme

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermbg=none ctermfg=8
highlight NonText ctermbg=none ctermfg=8

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic

set number                  " show line numbers
set relativenumber          " show relative line numbers

set wrap                    " turn on line wrapping
set wrapmargin=8            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

set autoindent              " automatically set indent of new line
set smartindent

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
set expandtab               " insert spaces rather than tabsfor <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set foldmethod=syntax       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

set ttyfast                 " faster redrawing
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros
set magic                   " Set magic on, for regex
set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink


" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

if has('mouse')
	set mouse=a
endif

" }}}

" Section Mappings {{{

" set a map leader for more key combos
let mapleader = ','

" shortcut to save
nmap <leader>, :w<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" " Navigate Panes or create new
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" window close
map <leader>wc :wincmd q<cr>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" }}}

" Section AutoGroups {{{
" file type specific settings
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

    " fix some issues with puppet and ruby
    if v:version >= 703
        " Note: Relative number is quite slow with Ruby, so is cursorline
        autocmd FileType ruby setlocal norelativenumber nocursorline regexpengine=1 foldmethod=manual lazyredraw
    endif

    " puppet-commentary
    autocmd FileType puppet setlocal commentstring=#\ %s
    
    " activate neomake for linting
    autocmd! BufWritePost * Neomake
    
    
augroup END

" }}}

" Section Ctags {{{  
" Default/Generic tag file
set tag=tags,.tags

autocmd FileType c              set tags=.tags_cpp,$HOME/.vim/tags/cpp
autocmd FileType cpp            set tags=.tags_cpp,$HOME/.vim/tags/cpp
autocmd FileType css            set tags=.tags_css,$HOME/.vim/tags/css
autocmd FileType java           set tags=.tags_java,$HOME/.vim/tags/java
autocmd FileType javascript     set tags=.tags_js,$HOME/.vim/tags/js
autocmd FileType html           set tags=.tags_html,$HOME/.vim/tags/html
autocmd FileType php            set tags=.tags_php,$HOME/.vim/tags/php
autocmd FileType sh             set tags=.tags_sh,$HOME/.vim/tags/sh
" }}}
" Section Plugins {{{
"

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1

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

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vim-marked 
let g:marked_app = "Marked"

" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>
nmap <leader>* *<c-o>:%s///gn<cr>

" makers for javascript syntax
let g:neomake_javascript_enabled_makers = [ 'eslint' ]
let g:neomake_jsx_enabled_makers = [ 'eslint' ]
let g:neomake_php_enabled_makers = [ 'php', 'phpmd', 'phpcs' ]
let g:neomake_php_phpcs_args_standard = 'PSR2'
let g:neomake_puppet_enabled_makers = [ 'puppetlint' ]

" vim-jsx 
let g:jsx_ext_required = 0 " enable jsx for all js files

" vim-javascript
let g:javascript_plugin_jsdoc = 1

"vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
" mapping for jsdoc commenting
nmap <silent> <c-d> <Plug>(jsdoc)

"mappings for YouCompleteme
noremap <leader>jd :YcmCompleter GoToDefinition<cr>
noremap <leader>jr :YcmCompleter GoToReferences<cr>
noremap <leader>rr :YcmCompleter RefactorRename<cr>

" set python paths for youcompleteme to work correctly
let g:python2_host_prog = '/usr/local/python'
let g:python3_host_prog = '/usr/local/python3'

" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0


" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" }}}
