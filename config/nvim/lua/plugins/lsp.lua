return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json"] = "/*.k8s.yaml",
              },
              trace = {
                server = "verbose",
              },
            },
          },
        },
        vimls = {},
        bashls = {},
        tsserver = {},
        pyright = {},
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
-- ruff_lsp = {},
--     prolog_ls = {},
--     neosfusionls = {},
--     phpactor = {},
--     rust_analyzer = {},
--     clangd = {},
--     lua_ls = {
--         settings = {
--             Lua = {
--                 runtime = {
--                     version = 'LuaJIT',
--                 },
--                 diagnostics = {
--                     globals = {'vim'},
--                 },
--                 workspace = {
--                     library = vim.api.nvim_get_runtime_file("", true),
--                 },
--                 telemetry = {
--                     enable = false,
--                 },
--             },
--         },
--     },
--     html = {
--         cmd = { "vscode-html-language-server", "--stdio" },
--         filetypes = { "html", "xhtml", "heex" }
--     },
--     cssls = {
--         cmd = { "vscode-css-language-server", "--stdio" },
--     },
--     jsonls = {
--         cmd = {"vscode-json-language-server", "--stdio"},
--         filetypes = {"json", "jsonc"},
--         settings = {
--             json = {
--             -- Schemas https://www.schemastore.org,
--                 schemas = {
--                     {
--                         fileMatch = {"package.json"},
--                         url = "https://json.schemastore.org/package.json"
--                     },
--                     {
--                         fileMatch = {"tsconfig*.json"},
--                         url = "https://json.schemastore.org/tsconfig.json"
--                     },
--                     {
--                         fileMatch = {
--                             ".prettierrc",
--                             ".prettierrc.json",
--                             "prettier.config.json"
--                         },
--                         url = "https://json.schemastore.org/prettierrc.json"
--                     },
--                     {
--                         fileMatch = {".eslintrc", ".eslintrc.json"},
--                         url = "https://json.schemastore.org/eslintrc.json"
--                     },
--                     {
--                         fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
--                         url = "https://json.schemastore.org/babelrc.json"
--                     },
--                     {
--                         fileMatch = {"lerna.json"},
--                         url = "https://json.schemastore.org/lerna.json"
--                     }
--                 }
--             }
--         }
--     }
--
