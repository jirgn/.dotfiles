return {
  {
    "/nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>k", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer (Neotree)" },
      { "<leader>y", "<cmd>Neotree reveal<cr>", desc = "Show current file in Explorer (Neotree)" },
      { "<leader>e", false },
      { "<leader>E", false },
    },
    opts = {
      window = {
        mappings = {
          ["P"] = {
            command = function(state)
              local node = state.tree:get_node()
              require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            end,
            desc = "focus parent",
            nowait = true,
          },
        },
      },
    },
  },
  {
    "tummetott/unimpaired.nvim",
    event = "VeryLazy",
    config = function()
      require("unimpaired").setup({
        keymaps = {
          exchange_above = {
            mapping = "[s",
            description = "swap line with [count] lines above",
            dot_repeat = true,
          },
          exchange_below = {
            mapping = "]s",
            description = "swap line with [count] lines below",
            dot_repeat = true,
          },
          exchange_section_above = {
            mapping = "[s",
            description = "Move section [count] lines up",
            dot_repeat = true,
          },
          exchange_section_below = {
            mapping = "]s",
            description = "Move section [count] lines down",
            dot_repeat = true,
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    keys = { -- load the plugin only when using it's keybinding:
      {
        "<leader>uu",
        "<cmd>lua require('undotree').toggle()<cr>",
        desc = "Toggle Undotree",
        mode = "n",
        noremap = true,
      },
    },
  },
}
