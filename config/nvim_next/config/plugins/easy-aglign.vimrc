" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

lua << EOF
-- better naming for which-key
local wk = require("which-key")
wk.register({ ga = "align (EasyAlign)" })
EOF

