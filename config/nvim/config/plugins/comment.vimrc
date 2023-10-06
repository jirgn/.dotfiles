lua <<EOF
local ft = require('Comment.ft')

ft
 .set('fusion', {'//%s', '/*%s*/'})

require('Comment').setup({})
EOF
