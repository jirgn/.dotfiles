" vim:fdm=marker

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create- 
    \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.config/nvim/plugged")

" colorschemes
Plug 'morhetz/gruvbox'

" utilities
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " code formatting with prettier tool
Plug 'honza/vim-snippets' " snippet library
Plug 'SirVer/ultisnips' " snippet manager
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'tpope/vim-eunuch' " syntactic sugar for Unix helpers
Plug 'cohama/lexima.vim' " autmatic closing of quotes, paranehesis, brackets, ...
Plug 'romainl/vim-cool' " autmatically turn of hlsearch when searching is done
Plug 'machakann/vim-highlightedyank' " visual feedback on yank command
Plug 'junegunn/goyo.vim' " distraction free writing
Plug 'jceb/vim-orgmode' | Plug 'tpope/vim-speeddating' " outline todo orga - clone of emacs org-mode


" additional commands/textobjects
Plug 'mbbill/undotree' " visualize undo branches
Plug 'nelstrom/vim-visual-star-search' " enables * search on visual selection
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-unimpaired' " mappings for easier usage of common actions like next, previous or line switching
Plug 'tpope/vim-abolish' " magic substition
Plug 'junegunn/vim-easy-align' " alignment 
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'szw/vim-maximizer' "maximizes a window and resizes it back again
Plug 'christoomey/vim-tmux-navigator' " integrate vim with tmux navigation

" autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-cssomni' , { 'for': [ 'css', 'scss', 'less' ] }
Plug 'ncm2/ncm2-tern',  { 'do': 'npm install', 'for': [ 'javascript', 'javascript.jsx' ] }
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'phpactor/ncm2-phpactor', { 'for': 'php' }
Plug 'pbogut/ncm2-alchemist', { 'for': 'elixir' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" search replace
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'wincent/ferret'

" project 
Plug 'mhinz/vim-startify' " fancy startscreen
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'eshion/vim-sync' " filesync to remote or local directory
Plug 'ludovicchabant/vim-gutentags' " ctag autogeneration
Plug 'embear/vim-localvimrc' " enable .lvimrc support in projects
Plug 'editorconfig/editorconfig-vim' " activates recognition of .editorconfig in projects

" git support
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'airblade/vim-gitgutter' " gitstatus in the gutter column
Plug 'junegunn/gv.vim' " extension for fugitive to show log --graph

" html / templates
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'javascript', 'javascript.jsx', 'typoscript' ] } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache'}  " mustach support
Plug 'juvenn/mustache.vim', { 'for': 'mustache' } " mustache support

" JavaScript
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' } " autocompletion and refactoring 
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript.jsx', 'javascript'  ]} " javascript syntax support
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
Plug 'heavenshell/vim-jsdoc', { 'for': [ 'javascript.jsx', 'javascript' ] }

" Typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescriptreact'] }
Plug 'mhartington/nvim-typescript', { 'for': ['typescript', 'typescriptreact'], 'do': './install.sh' }

" styles
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'stephenway/postcss.vim', { 'for': [ 'css', 'scss', 'less', 'stylus' ] } " postcss syntax highlight

" text transform (markdown, tex, html, ...)
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" puppet
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }	 " Puppet Syntax

" php
Plug 'stanangeloff/php.vim', { 'for': 'php' } " PHP Syntax
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' } " PHP Coding Style Fixer
Plug 'phpactor/phpactor', { 'for': 'php', 'do': 'composer install'} " php refactoring and completion
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' } " namespace completion

" typo3 neos
Plug 'jirgn/vim.typoscript', { 'for': 'typoscript' }

" elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

call plug#end()

