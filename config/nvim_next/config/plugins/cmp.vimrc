" set completeopt=menu,menuone,noselect

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
    }),
   mapping = cmp.mapping.preset.insert({
    ["<C-L>"] = cmp.mapping(function(fallback)
            if vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
    -- Your configuration here.
   })
  })

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

