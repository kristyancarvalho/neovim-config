vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>e", ":Ex<CR>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opts)
map("n", "<A-H>", ":BufferLineMovePrev<CR>", opts)
map("n", "<A-L>", ":BufferLineMoveNext<CR>", opts)

vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>o", "<Cmd>NvimTreeFocus<CR>", opts)
