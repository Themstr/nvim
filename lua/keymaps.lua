-- Keymaps
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Some Shortcuts
keymap("n", "<C-w>", ":q!<CR>", opts)
keymap("n", "<C-s>", ":w!<CR>", opts)
keymap("n", "<C-S-e>", ":NvimTreeToggle<CR>", opts)
-- Tabs
keymap("n", "<C-n>", ":tabnew<CR>", opts)
keymap("n", "<S-l>", ":tabNext<CR>", opts)
keymap("n", "<S-h>", ":tabprevious<CR>", opts)
-- Insert
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
-- Terminal --
keymap("n", "<C-`>", ":ToggleTerm<CR>", opts)
-- Better terminal navigation
keymap("t", "<ESC>", "<C-\\><C-N>", term_opts)
-- fzf
keymap("n", "<C-p>", ":FzfLua files<CR>", opts)