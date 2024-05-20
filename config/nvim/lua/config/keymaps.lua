-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- convinience
map("n", "<leader>.", "<C-^>", { desc = "Toggle with last buffer" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "ensure turnoff hlsearch" })
map("n", "<leader>xk", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "show diagnostic in floating window" })
