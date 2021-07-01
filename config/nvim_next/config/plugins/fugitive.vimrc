" Fugitive
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

lua << EOF
-- better naming for which-key
local wk = require("which-key")
wk.register({ 
    ["<leader>g"] = {
        name = "+git (Fugitive)",
        s = "status",
        e = "edit",
        r = "read",
        b = "blame"
    }
})
EOF

