lua << EOF

local wk = require("which-key")
wk.register({ 
    ["<leader>k"] = {
        name = "+rest",
        k = {":lua require(\"rest-nvim\").run(false)<CR>", "rest call for statement under cursor"},
        p = {":lua require(\"rest-nvim\").run(true)<CR>", "show curl for statement under cursor"},
        l = {":lua require(\"rest-nvim\").last()<CR>", "rerun latest request"},
    }
})

require("rest-nvim").setup({
    result = {
        formatters = {
        json = "jq",
        html = function(body)
            if vim.fn.executable("tidy") == 0 then
            return body
            end
            -- stylua: ignore
            return vim.fn.system({
            "tidy",
            "--quiet",          "yes",
            "--indent",         "yes",
            "--force-output",   "yes",
            "--tidy-mark",      "no",
            "--show-body-only", "yes",
            "--show-errors",    "0",
            "--show-warnings",  "0",
            "-",
            }, body):gsub("\n$", "")
        end,
        },
    }
})
EOF
