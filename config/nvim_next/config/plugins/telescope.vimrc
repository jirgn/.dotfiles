nnoremap <leader>ff :lua require'telescope.builtin'.find_files{}<cr>
nnoremap <leader>fg :lua require'telescope.builtin'.live_grep{}<cr>
nnoremap <leader>fga :lua require'telescope.builtin'.grep_string{}<cr>
nnoremap <leader>fb :lua require'telescope.builtin'.buffers{}<cr>
nnoremap <leader>fh :lua require'telescope.builtin'.help_tags{}<cr>
nnoremap <leader>fk :lua require'telescope.builtin'.keymaps{}<cr>
nnoremap <leader>f? :lua require'telescope.builtin'.builtin{}<cr>

lua << EOF
local present, telescope = pcall(require, "telescope")
if not present then
	return
end

local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-w>"] = actions.send_selected_to_qflist,
        ["<C-q>"] = actions.send_to_qflist,
      },
      n = {
        ["<C-w>"] = actions.send_selected_to_qflist,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
  }
}
telescope.load_extension('fzf')

-- better naming for which-key
local wk = require("which-key")
wk.register({
    ["<leader>f"] = "+find"
})
EOF
