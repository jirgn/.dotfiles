return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = {
          "~/.dotfiles/config/nvim/vscode_snippets",
        },
      })
    end,
  },
  {
    "emmanueltouzery/elixir-extras.nvim",
  },
  {
    "nvim-orgmode/orgmode",
    dependencies = { "nvim-orgmode/org-bullets.nvim" },
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup org-bullets
      require("org-bullets").setup()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = { "~/org/slipbox/**/*", "~/org/notes/**/*" },
        org_default_notes_file = "~/org/notes/inbox.org",
        org_todo_keywords = {
          "NEXT(n)",
          "TODO(t)",
          "PROGRESS(p)",
          "WAITING(w)",
          "SOMETIME(s)",
          "|",
          "DONE(d)",
          "CANCELLED(c)",
        },
      })
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.g.codeium_disable_bindings = 1
      -- vim.g.codeium_filetypes_disabled_by_default = true
      -- vim.g.codeium_filetypes = {
      --   rust = true,
      --   typescript = true,
      -- }
    end,
    keys = {
      {
        "<c-g><cr>",
        "codeium#Accept()",
        mode = "i",
        noremap = true,
        expr = true,
        desc = "Accept suggestion",
      },
      {
        "<c-g><c-n>",
        "codeium#CycleCompletions(1)",
        mode = "i",
        noremap = true,
        expr = true,
        desc = "Next suggestion",
      },
      {
        "<c-g><c-p>",
        "codeium#CycleCompletions(-1)",
        mode = "i",
        noremap = true,
        expr = true,
        desc = "Previous suggestion",
      },
      {
        "<c-g><c-x>",
        "codeium#Clear()",
        mode = "i",
        noremap = true,
        expr = true,
        desc = "Clear suggestions",
      },
      {
        "<c-g><c-o>",
        "codeium#Complete()",
        mode = "i",
        noremap = true,
        expr = true,
        desc = "Trigger suggestions",
      },
    },
  },
}
