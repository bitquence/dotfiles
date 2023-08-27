local g = vim.g
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Map leader key to Space
g.mapleader = " "

-- Easier navigation between panes
keymap("n", "<C-h>", "<C-w>h", opts) -- Switch to left pane
keymap("n", "<C-j>", "<C-w>j", opts) -- Switch to bottom pane
keymap("n", "<C-k>", "<C-w>k", opts) -- Switch to top pane
keymap("n", "<C-l>", "<C-w>l", opts) -- Switch to right pane

-- Easier unindenting in insert mode
keymap("i", "<S-Tab>", "<C-d>", opts) -- Unindent once

-- Stay in visual mode when indenting or unindenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Mimic Emacs horizontal movement bindings
keymap("i", "<C-a>", "<C-o>^", opts) -- Go to beginning of line
keymap("i", "<C-e>", "<C-o>$", opts) -- Go to end of line

-- Easily access directory listing (Ex mode)
keymap("n", "<Leader>x", ":Ex <CR>", opts)
