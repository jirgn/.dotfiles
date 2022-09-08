" lua << EOF
" local snap = require('snap')
" local file = snap.config.file
" local vimgrep = snap.config.vimgrep
" snap.maps {
"     {"<Leader>ff", file {producer = "fd.file"}},
"     {"<Leader>fb", file {producer = "vim.buffer"}},
"     {"<Leader>fo", file {producer = "vim.oldfile"}},
"     {"<Leader>fh", file {
"         prompt = "Help>",
"         producer = snap.get('producer.vim.help'),
"         select = snap.get('select.help').select,
"         views = { snap.get('preview.help') }
"     }},
"     {"<Leader>fg", vimgrep {}},
" }
" EOF
