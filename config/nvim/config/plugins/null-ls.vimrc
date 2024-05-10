lua << EOF
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- javascript
        require("none-ls.diagnostics.eslint"),
        null_ls.builtins.formatting.prettier,
        -- elixir
        null_ls.builtins.diagnostics.credo,
        -- python
        null_ls.builtins.diagnostics.mypy
        -- python replaced by ruff-lsp
        -- null_ls.builtins.diagnostics.flake8,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.autoflake,
    }
})

EOF
