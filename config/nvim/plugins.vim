call plug#begin("~/.config/nvim/plugged")

" colorschemes
Plug 'dracula/vim'

" utilities
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'godlygeek/tabular' " conde align in tabular manner
Plug 'cohama/lexima.vim' " autmatic closing of quotes, paranehesis, brackets, ...
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'christoomey/vim-tmux-navigator' " integrate vim with tmux navigation
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'editorconfig/editorconfig-vim' " activates recognition of .editorconfig in projects

Plug 'SirVer/ultisnips' " snippet manager
Plug 'honza/vim-snippets' " snippet library

Plug 'Valloric/YouCompleteMe' " fancy autocompletion for several languages
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'} " generator for goto commands in ycm to work
Plug 'vim-scripts/matchit.zip' " extended % matching

Plug 'embear/vim-localvimrc' " enable .lvimrc support in projects
Plug 'mhinz/vim-startify' " fancy startscreen

" html / templates
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'javascript', 'javascript.jsx' ] } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mustache/vim-mustache-handlebars' " mustach support
" Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] } " jade support
Plug 'juvenn/mustache.vim', { 'for': 'mustache' } " mustache support

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript.jsx', 'javascript'  ]} " javascript syntax support
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
Plug 'heavenshell/vim-jsdoc', { 'for': [ 'javascript.jsx', 'javascript' ] }
 
" styles
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support

" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" puppet
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }	 " Puppet Syntax

" php
Plug 'stanangeloff/php.vim', { 'for': 'php' } " PHP Syntax
Plug 'shawncplus/phpcomplete', { 'for': 'php' } "PHP Autocompleter

call plug#end()

