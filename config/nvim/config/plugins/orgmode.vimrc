" init.vim
lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Cloud/dropbox/org/**/*'},
  org_default_notes_file = '~/Cloud/dropbox/org/inbox.org',
  org_todo_keywords = { 'NEXT(n)', 'TODO(t)', 'PROGRESS(p)', 'WAITING(w)', 'SOMETIME(s)', '|', 'DONE(d)', 'CANCELLED(c)'},
})

-- better naming for which-key
local wk = require("which-key")
wk.register({
    ["<leader>o"] = {
        name = "+orgmode org",
        a = "agenda prompt",
        c = "capture prompt",
        i = {
            name  = "+insert",
            t = "todo heading respect content",
            T = "todo heading",
            h = "heading respect content",
            s = "schedule",
            d = "deadline",
            ['!'] = "timestamp interactive",
            ['.'] = "timestamp",
        },
        x = {
            name = "+clock",
            q = "cancel",
            j = "goto",
            e = "effort",
            o = "clock out",
            i = "clock in",
        },
        ['$'] = "archive",
        ["'"] = "edit special",
        ['*'] = "toggle heading",
        [','] = "set priority",
        A = "toggle archive tag",
        e = "export",
        J = "subtree down",
        K = "subtree up",
        o = "open at point",
        r = "refile to headline to destination",
        t = "set tags",
    }
})
EOF
