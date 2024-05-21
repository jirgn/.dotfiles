return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    opts = function(_, opts)
      local nls = require("null-ls")

      -- opts.sources = opts.sources or {}
      -- table.insert(opts.sources, )
      --
      -- table.insert(opts.sources, nls.builtins.diagnostics.credo)
      opts.sources = vim.list_extend(opts.sources or {}, {
        require("none-ls.diagnostics.eslint"),
        nls.builtins.diagnostics.credo,
      })
    end,
  },
}
