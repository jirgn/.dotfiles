set tabstop=2
set softtabstop=2
set shiftwidth=2            " number of spaces to use for indent and unindent

lua << EOF
local wk = require("which-key")
wk.register({
    prefix = "<leader>f",
    d = {"<cmd>lua require('elixir-extras').elixir_view_docs({include_mix_libs=true})<cr>", "elixir documentation"}
})
EOF
