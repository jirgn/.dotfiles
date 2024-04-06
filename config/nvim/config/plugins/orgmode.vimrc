" init.vim
lua << EOF

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
