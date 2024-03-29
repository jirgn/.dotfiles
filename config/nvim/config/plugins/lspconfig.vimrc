lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>cn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>cl', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
  buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format {async=true}<CR>", opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local server_configs = { 
    neosfusionls = {}, 
    tsserver = {}, 
    phpactor = {}, 
    vimls = {}, 
    bashls = {},
    rust_analyzer = {}, 
    clangd = {},
    yamlls = {
        settings = {
            yaml = {
                schemas = {
                    ["https://raw.githubusercontent.com/Sebobo/Shel.Neos.Schema/main/NodeTypes.Schema.json"] = {
                        "DistributionPackages/*/Configuration/NodeTypes*.yaml",
                        "NodeTypes/**/*.yaml"
                    },
                    ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
                    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json"] = "/*.k8s.yaml",
                },
                trace = {
                    server = "verbose"
                }
            }
        },
    },
    elixirls = {
        cmd = { "/usr/bin/elixir-ls" },
        settings = {
            elixirLS = {
                dialyzerEnabled = true,
                fetchDeps = true,
            }
        }
    },
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = {'vim'},
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    },
    html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "xhtml", "heex" }
    },
    cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
    },
    jsonls = {
        cmd = {"vscode-json-language-server", "--stdio"},
        filetypes = {"json", "jsonc"},
        settings = {
            json = {
            -- Schemas https://www.schemastore.org,
                schemas = {
                    {
                        fileMatch = {"package.json"},
                        url = "https://json.schemastore.org/package.json"
                    },
                    {
                        fileMatch = {"tsconfig*.json"},
                        url = "https://json.schemastore.org/tsconfig.json"
                    },
                    {
                        fileMatch = {
                            ".prettierrc",
                            ".prettierrc.json",
                            "prettier.config.json"
                        },
                        url = "https://json.schemastore.org/prettierrc.json"
                    },
                    {
                        fileMatch = {".eslintrc", ".eslintrc.json"},
                        url = "https://json.schemastore.org/eslintrc.json"
                    },
                    {
                        fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
                        url = "https://json.schemastore.org/babelrc.json"
                    },
                    {
                        fileMatch = {"lerna.json"},
                        url = "https://json.schemastore.org/lerna.json"
                    }
                }
            }
        }
    }
}

for name, config  in pairs(server_configs) do
    -- add fallback if not explicitly defined
    config.on_attach = ((config and config.on_attach) and {config.on_attach} or {on_attach})[1]
    config.capabilities = ((config and config.capabilities) and {config.capabilities} or {capabilities})[1]

    -- config.on_attach = on_attach
    -- config.capabilities = capabilities
    nvim_lsp[name].setup(config)
end


-- better naming for which-key
local wk = require("which-key")
wk.register({
    gD = "Go to Declaration (LSP)",
    gd = "Go to Definition (LSP)",
    gi = "Go to Implementation (LSP)",
    gr = "Go to References (LSP)",
    ["<C-k"] = "signature help (LSP)",
    ["<leader>D"] = "Go to Type Defintion (LSP)",
    ["<leader>w"] = {
       name = "+workspace (LSP)",
       a = "add",
       r = "remove",
       l = "list"
    },
    ["<leader>c"] = {
       name = "+code refactor (LSP)",
       n = "rename",
       a = "code-action",
       l = "code-lens",
       f = "format"
    },
    ["<leader>e"] = "show line error diagnostic(LSP)",
    ["]d"] = "Next diagnostic (LSP)",
    ["[d"] = "Prev diagnostic (LSP)",
    ["<leader>q"] = "diagnostic to loclist (LSP)"
})

EOF
