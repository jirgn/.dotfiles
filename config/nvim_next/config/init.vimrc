" vim:fdm=marker

if empty(glob('~/.dotfiles/config/nvim_next/plugged'))
  silent !curl -fLo ~/.dotfiles/config/nvim_next/autoload/plug.vim --create- 
    \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.dotfiles/config/nvim_next/plugged")

" colorschemas
Plug 'christianchiarulli/nvcode-color-schemes.vim'

" util
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'folke/which-key.nvim', {'branch': 'main'}

" ui
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'romainl/vim-cool' " autmatically turn of hlsearch when searching is done
Plug 'machakann/vim-highlightedyank' " visual feedback on yank command
Plug 'christoomey/vim-tmux-navigator' " integrate vim with tmux navigation
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}

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
Plug 'ahmedkhalf/lsp-rooter.nvim', { 'branch': 'main' } " project manager - startscreen
" Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
" requires
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua', { 'on': ['NvimTreeToggle', 'NvimTreeFindFile'] }


" language support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" git
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'airblade/vim-gitgutter' " gitstatus in the gutter column
Plug 'junegunn/gv.vim' " extension for fugitive to show log --graph

call plug#end()
