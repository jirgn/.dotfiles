set completeopt=menu,menuone,noselect

lua <<EOF
  local present, cmp = pcall(require, "cmp")
  if not present then
    return
  end

  local lspkind = require('lspkind')

  lspkind.init()

  cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            with_text = false,
            maxwidth = 50,
            menu = {
                buffer = "BUF",
                nvim_lsp = "LSP",
                path = "PATH",
                vsnip = "SNIP",
            }
        }),
    },
    mapping = cmp.config.mapping.preset.insert(),
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = 'vsnip' }, 
      { name = 'buffer' }, 
      { name = 'nvim_lsp' },
      { name = 'path' }, 
      -- { name = 'neorg' }, 
      { name = 'orgmode' }
    })
  })

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

  -- Use buffer source for `/`.
--  cmp.setup.cmdline('/', {
--    sources = {
--      { name = 'buffer' }
--    }
--  })

  -- Use cmdline & path source for ':'.
--  cmp.setup.cmdline(':', {
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })

EOF

