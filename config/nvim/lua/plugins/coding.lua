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
}
