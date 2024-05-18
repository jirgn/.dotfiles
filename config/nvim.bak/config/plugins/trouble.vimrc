nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

lua <<EOF
local wk = require("which-key")
wk.register({ 
    ["<leader>x"] = {
        name = "+trouble",
        x = "toggle trouble view",
        w = "workspace - show all diagnostics of workspace",
        d = "document - show diagnostics of current document",
        l = "location list - show in prettry format",
        q = "quickfix list - show in prettry format",
    }
})
local nvim_treelocal trouble = require("trouble").setup { }
EOF
