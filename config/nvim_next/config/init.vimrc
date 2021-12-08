" vim:fdm=marker

if empty(glob('~/.dotfiles/config/nvim_next/plugged'))
  silent !curl -fLo ~/.dotfiles/config/nvim_next/autoload/plug.vim --create-dirs
    \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.dotfiles/config/nvim_next/plugged")

" colorschemas
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'folke/tokyonight.nvim'

" util
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets', {'branch': 'main'}
Plug 'folke/which-key.nvim', {'branch': 'main'}
Plug 'editorconfig/editorconfig-vim' " activates recognition of .editorconfig in projects
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" ui
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'romainl/vim-cool' " autmatically turn of hlsearch when searching is done
Plug 'machakann/vim-highlightedyank' " visual feedback on yank command
Plug 'christoomey/vim-tmux-navigator' " integrate vim with tmux navigation
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'javascript', 'javascript.jsx', 'typoscript' ] } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
Plug 'Pocco81/TrueZen.nvim'

" completion
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'

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

" project
Plug 'mhinz/vim-startify' " fancy startscreen
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" language support
Plug 'neovim/nvim-lspconfig'
Plug '~/Code/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'

" git
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'airblade/vim-gitgutter' " gitstatus in the gutter column
Plug 'junegunn/gv.vim' " extension for fugitive to show log --graph

call plug#end()
