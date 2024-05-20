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
          ["P"] = function(state)
            local node = state.tree:get_node()
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end,
          desc = "Navigate to Parent",
        },
      },
    },
  },
  {
    "tummetott/unimpaired.nvim",
    event = "VeryLazy",
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.align").setup()
    end,
  },
}
