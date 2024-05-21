return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- neosfusionls = {},
        phpactor = {},
        html = {
          filetypes = { "html", "xhtml", "heex" },
        },
        cssls = {},
        elixirls = {
          settings = {
            elixirLS = {
              dialyzerEnabled = true,
              fetchDeps = true,
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/Sebobo/Shel.Neos.Schema/main/NodeTypes.Schema.json"] = {
                  "DistributionPackages/*/Configuration/NodeTypes*.yaml",
                  "NodeTypes/**/*.yaml",
                },
                -- ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json"] = "/*.k8s.yaml",
              },
              -- trace = {
              --   server = "verbose",
              -- },
            },
          },
        },
        vimls = {},
        bashls = {},
        tsserver = {},
        emmet_language_server = {
          filetypes = {
            "css",
            "eruby",
            "heex",
            "elixir",
            "html",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact",
          },
        },
      },
    },
  },
}
