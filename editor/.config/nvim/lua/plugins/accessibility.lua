return {
	{
		"monaqa/dial.nvim",
		keys = {
			{ mode = { "n" }, "<C-a>", function() return require("dial.map").inc_normal() end, expr = true },
			{ mode = { "n" }, "<C-x>", function() return require("dial.map").dec_normal() end, expr = true },
			{ mode = { "n" }, "g<C-a>", function() return require("dial.map").inc_gnormal() end, expr = true },
			{ mode = { "n" }, "g<C-x>", function() return require("dial.map").dec_gnormal() end, expr = true },
			{ mode = { "v" }, "<C-a>", function() return require("dial.map").inc_visual() end, expr = true },
			{ mode = { "v" }, "<C-x>", function() return require("dial.map").dec_visual() end, expr = true },
			{ mode = { "v" }, "g<C-a>", function() return require("dial.map").inc_gvisual() end, expr = true },
			{ mode = { "v" }, "g<C-x>", function() return require("dial.map").dec_gvisual() end, expr = true },
		},
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.decimal_int,
					augend.integer.alias.hex,
					augend.constant.alias.bool,
				},
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = {
				char = "▏"
				--char = "⎸",
				--char = "⥠",
			},
		},
	},

	--[[
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("illuminate").configure({
				delay = 0,
				filetypes_denylist = {},
				under_cursor = false,
			})

			-- change the highlight style
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

			--- auto update the highlight style on colorscheme change
			vim.api.nvim_create_autocmd({ "ColorScheme" }, {
				pattern = { "*" },
				callback = function(_)
					vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
					vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
					vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
				end,
			})
		end,
		enabled = false,
	},

	{
		"mrjones2014/legendary.nvim",
		enabled = false,
	},

	{
		"folke/which-key.nvim",
		enabled = false,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		enabled = false,
	},

	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		enabled = false,
	},
	]]--
}
