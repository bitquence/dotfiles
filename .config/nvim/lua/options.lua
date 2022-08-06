local eval = vim.api.nvim_eval
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

-- Set width of tab character
opt.tabstop = 4
opt.softtabstop = 4

-- Set hybrid relative line numbers
opt.relativenumber = true
opt.number = true

-- Enable autocompletion and show menu at full length
opt.wildmenu = true
opt.wildmode = "full"

opt.shiftwidth = 4 -- Set width of tab character in normal mode
opt.autoindent = true -- Automatically indent on newline
opt.smartindent = true -- Smart indentation
opt.termguicolors = true -- Enable terminal true colors
opt.mouse = "a" -- Enable use of mouse controls in all modes (iTerm2)
opt.colorcolumn = "80" -- Start highlighting at 80 characters
opt.textwidth = 0 -- Do not insert a line break at 80 characters automatically
opt.scrolloff = 8 -- Set the number of lines to keep the cursor over or under
opt.cursorline = true -- Highlight the line the cursor is currently only
opt.wildignorecase = true -- Ignore case when autocompleting files
opt.ignorecase = true -- Ignore case when autocompleting commands
opt.showmode = false -- Disables mode indication (we are using lightline)
--opt.nohlsearch = true -- Do not highlight results of a search

-- Don't highlight matching parens (macOS)
if (eval('exists(":NoMatchParen")')) then
	vim.g.loaded_matchparen = 1
end
