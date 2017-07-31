" vim:fdm=marker

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create- 
    \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.config/nvim/plugged")


" colorschemes
" Plug 'dracula/vim'
" Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'

" utilities
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'airblade/vim-gitgutter' " gitstatus in the gutter column
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'brooth/far.vim', { 'do': ':UpdateRemotePlugins' } " powerful search and replace tool
Plug 'christoomey/vim-tmux-navigator' " integrate vim with tmux navigation
Plug 'cohama/lexima.vim' " autmatic closing of quotes, paranehesis, brackets, ...
Plug 'editorconfig/editorconfig-vim' " activates recognition of .editorconfig in projects
Plug 'embear/vim-localvimrc' " enable .lvimrc support in projects
Plug 'honza/vim-snippets' " snippet library
Plug 'mbbill/undotree' " visualize undo branches
Plug 'mhinz/vim-startify' " fancy startscreen
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'SirVer/ultisnips' " snippet manager
Plug 'szw/vim-maximizer' "maximizes a window and resizes it back again
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'ludovicchabant/vim-gutentags' " ctag autogeneration
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplettion
Plug 'junegunn/vim-easy-align' " alignment 
Plug 'majutsushi/tagbar' " outliner based on ctags

" html / templates
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'javascript', 'javascript.jsx' ] } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }  " mustach support
Plug 'juvenn/mustache.vim', { 'for': 'mustache' } " mustache support

" JavaScript
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' } " autocompletion and refactoring 
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' } " javascript extended navigation with tern
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript.jsx', 'javascript'  ]} " javascript syntax support
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
Plug 'heavenshell/vim-jsdoc', { 'for': [ 'javascript.jsx', 'javascript' ] }
 
" styles
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'stephenway/postcss.vim', { 'for': [ 'css', 'scss', 'less', 'stylus' ] } " postcss syntax highlight

" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support

" confluence
Plug 'jirgn/confluencewiki.vim', { 'for': 'confluencewiki' }

" puppet
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }	 " Puppet Syntax

" php
Plug 'stanangeloff/php.vim', { 'for': 'php' } " PHP Syntax
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' } " PHP Coding Style Fixer
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' } " PHP Autocompleter
Plug 'joonty/vdebug', { 'for': 'php' } " dpkg debugger 
" Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' } "PHP Autocompleter

call plug#end()

