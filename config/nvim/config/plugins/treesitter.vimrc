set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
local present, treesitter = pcall(require, "nvim-treesitter")
if not present then
	return
end


require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    }
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["a{"] = "@block.outer",
        ["i}"] = "@block.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = { query = "@function.outer", desc = "Next function start"},
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
      },
      goto_next_end = {
        ["]M"] = { query = "@function.outer", desc = "Next function start"},
        ["]["] = { query = "@class.outer", desc = "Next class start" },
      },
      goto_previous_start = {
        ["[m"] = { query = "@function.outer", desc = "Previous function start" },
        ["[["] = { query = "@class.outer"   , desc = "Previous class start" },
      },
      goto_previous_end = {
        ["[M"] = { query = "@function.outer", desc = "Previous function start"},
        ["[]"] = { query = "@class.outer",    desc = "Previous function start"},
      },
    }
  }
}

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- add local fusion parser for dev purposes
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.fusion = {
  install_info = {
    url = "~/Code/tree-sitter/tree-sitter-fusion", -- local path to development
    files = {"src/parser.c", "src/scanner.c"}
  },
}

parser_config.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

EOF
