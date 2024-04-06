lua << EOF
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- javascript
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier,

        -- elixir
        null_ls.builtins.diagnostics.credo,

        -- python -> ruffls
        -- null_ls.builtins.diagnostics.flake8,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.autoflake
    }
})

EOF
