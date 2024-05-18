lua <<EOF
local wk = require("which-key")

wk.register({ 
    ["<leader>p"] = {
        name = "+preview",
        m = {
            name = "+markdown",
            m = {"<cmd>MarkdownPreviewToggle<CR>", "Toggle Markdown Preview"},
            s = {"<cmd>MarkdownPreviewStart<CR>", "Start Markdown Preview"},
            x = {"<cmd>MarkdownPreviewStop<CR>", "Stop Markdown Preview"},
        }
    }
})
EOF
