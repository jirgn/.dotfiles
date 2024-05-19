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
}
