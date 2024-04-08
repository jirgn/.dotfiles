lua << EOF
require('copilot').setup({
  panel = {
    enabled = true,
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
    keymap = {
      open = "<C-g>o",
    }
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-g><Enter>",
      accept_word = false,
      accept_line = false,
      next = "<C-g>n",
      prev = "<C-g>p",
      dismiss = "<C-g>d",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
EOF
