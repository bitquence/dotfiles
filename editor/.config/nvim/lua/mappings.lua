-- Map leader key to Space
vim.g.mapleader = " "

local map = function(mode, before, after, extra_opts)
	local opts = { noremap = true, silent = true, }
	-- append all `extra_opts` entries to our options
	if extra_opts then
		vim.tbl_extend("force", opts, extra_opts)
	end
	vim.api.nvim_set_keymap(mode, before, after, opts)
end

-- Easier navigation between panes
map("n", "<C-h>", "<C-w>h", { desc = "Switch to left pane" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch to bottom pane" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch to top pane" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch to right pane" })

-- Mimic Emacs horizontal movement bindings
map("i", "<C-a>", "<C-o>^", { desc = "Go to first character of line" })
map("i", "<C-e>", "<C-o>$", { desc = "Go to end of line" })

-- Easier unindenting in insert mode
map("i", "<S-Tab>", "<C-d>", { desc = "Unindent once" })
map("i", "<C-d>", "<NOP>")

-- Stay in visual mode after indenting or unindenting
map("v", "<", "<gv", { desc = "Unindent and remain in visual mode" })
map("v", ">", ">gv", { desc = "Indent and remain in visual mode" })

-- https://42.fr/ related commands
map("n", "<Leader>ft", "<CMD>Stdheader<CR>", { desc = "Insert 42 file header" })

-- Easily access directory listing (Ex mode)
map("n", "<Leader>x", "<CMD>Explore<CR>", { desc = "Browse netrw" })

-- TODO: fill with commands
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(_)

	end
})
