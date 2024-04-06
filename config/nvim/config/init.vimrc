if empty(glob('~/.dotfiles/config/nvim/plugged'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  " autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.dotfiles/config/nvim/plugged")

" colorschemas
Plug 'folke/tokyonight.nvim'
Plug 'mcchrish/zenbones.nvim' 
    Plug 'rktjmp/lush.nvim'

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
    Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'romainl/vim-cool' " autmatically turn of hlsearch when searching is done
Plug 'machakann/vim-highlightedyank' " visual feedback on yank command
Plug 'christoomey/vim-tmux-navigator' " integrate vim with tmux navigation
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'heex', 'elixir', 'javascript', 'javascript.jsx', 'fusion' ] } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'nvim-lualine/lualine.nvim'
Plug 'Pocco81/TrueZen.nvim'
Plug 'anuvyklack/pretty-fold.nvim'
Plug 'ggandor/leap.nvim'

" completion
Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-vsnip'

" additional commands/textobjects
Plug 'mbbill/undotree' " visualize undo branches
Plug 'nelstrom/vim-visual-star-search' " enables * search on visual selection
Plug 'numToStr/Comment.nvim' " comment stuff out
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-unimpaired' " mappings for easier usage of common actions like next, previous or line switching
Plug 'tpope/vim-abolish' " magic substition
Plug 'junegunn/vim-easy-align' " alignment
Plug 'andymass/vim-matchup' " better match paren support
Plug 'windwp/nvim-autopairs' " add closing parens and other matching pair chars

" project
Plug 'mhinz/vim-startify' " fancy startscreen
Plug 'nvim-tree/nvim-web-devicons' " for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-orgmode/orgmode'

" language support
" Plug 'neovim/nvim-lspconfig'
Plug '~/Code/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'nvimtools/none-ls.nvim', { 'branch': 'main' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug '~/Code/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'nvim-neotest/neotest'
    Plug 'jfpedroza/neotest-elixir'
    Plug 'nvim-neotest/neotest-vim-test' 
    Plug 'vim-test/vim-test'
Plug 'folke/trouble.nvim'
Plug 'emmanueltouzery/elixir-extras.nvim'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

" debugging
Plug 'mfussenegger/nvim-dap'
    Plug 'nvim-neotest/nvim-nio'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'

" git
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'airblade/vim-gitgutter' " gitstatus in the gutter column
Plug 'junegunn/gv.vim' " extension for fugitive to show log --graph

call plug#end()
