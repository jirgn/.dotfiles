lua <<EOF
    local present, npairs = pcall(require, "nvim-autopairs")
    if not present then
        return
    end
    local Rule = require('nvim-autopairs.rule')

    npairs.setup({})
    npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
    npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
    npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
    npairs.add_rules({
        Rule("<%", " %>", {"elixir", "heex", "surface"} )
    })
EOF
