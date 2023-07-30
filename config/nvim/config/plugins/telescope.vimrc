nnoremap <leader>ff  <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg  <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fga <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fo  <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>fb  <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh  <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fk  <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>f?  <cmd>lua require('telescope.builtin').builtin()<cr>

lua << EOF
local present, telescope = pcall(require, "telescope")
if not present then
	return
end

local actions = require('telescope.actions')
local trouble_provider = require('trouble.providers.telescope')
local themes = require('telescope.themes')

telescope.setup{
  defaults = {
    sorting_strategy = "ascending",

    layout_strategy = "bottom_pane",
    layout_config = {
      height = 25,
    },

    border = true,
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    mappings = {
      i = {
        ["<C-w>"] = actions.send_selected_to_qflist,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-t>"] = trouble_provider.open_with_trouble,
      },
      n = {
        ["<C-w>"] = actions.send_selected_to_qflist,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-t>"] = trouble_provider.open_with_trouble,
      },
    },
  },
  -- pickers = {
  --   find_files = {
  --     theme = 'ivy'
  --   }
  -- }
}
telescope.load_extension('fzf')
telescope.load_extension('dap')
-- require('telescope').load_extension('dap')

-- better naming for which-key
local wk = require("which-key")
wk.register({
    ["<leader>f"] = "+find"
})
EOF
