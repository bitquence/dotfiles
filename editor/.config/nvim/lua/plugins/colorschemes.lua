return {
	{ 'ayu-theme/ayu-vim', lazy = true },
	{ 'folke/tokyonight.nvim', lazy = true },
	{ 'joshdick/onedark.vim', lazy = true },
	{ 'nyoom-engineering/oxocarbon.nvim', lazy = true },
	{ 'projekt0n/github-nvim-theme', lazy = true },

	{
		'junegunn/seoul256.vim',
		config = function()
			-- Range (for dark mode): 233 (darkest) ~ 239 (lightest)
			vim.g.seoul256_background = 233
		end,
		lazy = true
	},

	{
		'sainnhe/sonokai',
		config = function()
			vim.g.sonokai_style = "espresso" -- Takes one of (andromeda|default|espresso)
			vim.g.sonokai_diagnostic_virtual_text = 1 -- Enable colored error messages
		end,
		lazy = true
	},

	{
		'ellisonleao/gruvbox.nvim',
		config = function()
			local gruvbox = require('gruvbox')
			gruvbox.setup({
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			vim.cmd('colorscheme gruvbox')
		end,
		lazy = false, -- load this colorscheme during startup
		priority = 1000, -- load this colorscheme before all others
	},
}
