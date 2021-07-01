nnoremap <leader>k :NvimTreeToggle<CR>
nnoremap <leader>y :NvimTreeFindFile<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

lua << EOF
-- better naming for which-key
local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        k = "Filetree toggle",
        y = "Filetree find current file",
        r = "Filetree refresh"
    }
})
EOF
