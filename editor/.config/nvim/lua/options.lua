local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

-- Omit backup files
opt.backup = false -- Don't use backup files
opt.writebackup = false -- Don't backup the file while editing
opt.swapfile = false -- Don't create swap files for new buffers
opt.updatecount = 0 -- Don't write swap files after some number of updates

-- Enable autocompletion and show menu at full length
--opt.wildmode = "full"
opt.wildmenu = true
opt.wildignorecase = true

-- Pattern settings
opt.ignorecase = true
opt.smartcase = true -- Run patterns as case-insensitive unless pattern contains uppercase characters
--opt.nohlsearch = true -- Do not highlight results of a search

-- Indentation settings
--opt.autoindent = true
--opt.smartindent = true

-- Enable use of mouse controls in all modes 
opt.mouse = "a"

-- Map `K` to open the vim manual instead of the global `man` executable
opt.keywordprg = ":help"

-- Limit the amount of completion items that will show up at once on the screen
opt.pumheight = 10

--------------- Cosmetic changes ---------------

-- Set width of tab character
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Set hybrid relative line numbers
opt.relativenumber = true
opt.number = true

opt.colorcolumn = "80" -- Start highlighting at 80 characters
opt.textwidth = 0 -- Do not insert a line break at 80 characters automatically
opt.termguicolors = true -- Enable terminal true colors
opt.scrolloff = 8 -- Always keep eight lines above and below the cursor
--opt.cursorline = true -- Highlight the line the cursor is currently on
opt.showmode = false -- Disables mode indication (we are using lightline)

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

-- Highlight text that is yanked
autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end
})

-- Don't highlight matching parens (macOS)
if vim.fn.exists(":NoMatchParen") then
	vim.g.loaded_matchparen = 1
end
