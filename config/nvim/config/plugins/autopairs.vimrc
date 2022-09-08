lua <<EOF
    local present, npairs = pcall(require, "nvim-autopairs")
    if not present then
        return
    end
    npairs.setup({})
    npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
    npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
    npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
EOF
