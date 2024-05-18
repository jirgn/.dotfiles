return {
  {
    "/nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>k", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer (Neotree)" },
      { "<leader>y", "<cmd>Neotree reveal<cr>", desc = "Show current file in Explorer (Neotree)" },
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
  {
    "tummetott/unimpaired.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here if you wish to override the default settings
    },
  },
}
