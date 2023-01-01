lua << EOF
-- better naming for which-key
local wk = require("which-key")
wk.register({ 
    ["<leader>t"] = {
        name = "+neotest",
        t = {"<cmd>lua require('neotest').run.run()<CR>", "test nearest"},
        a = {"<cmd>:TestSuite<CR>", "test complete suite"},
        f = {"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "test file"},
        j = {
            name = "+jump",
            j = {"<cmd>:TestVisit<CR>", "corresponding test"},
            n = {"<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>", "next failed"},
            p = {"<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>", "previous failed"}
        },
        o = {"<cmd>lua require('neotest').output_panel.toggle()<CR>", "toggle test output_panel"},
        s = {"<cmd>lua require('neotest').summary.toggle()<CR>", "toggle summary panel"},
    }
})

require("neotest").setup({
  adapters = {
    require("neotest-elixir"),
    require("neotest-vim-test")({
      ignore_file_types = { "ex", "exs"},
    }),
  },
})
EOF
