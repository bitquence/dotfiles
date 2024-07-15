return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"rust",
					"lua",
					"toml",
					"json",
					"vim",
					"regex",
					"bash",
					"markdown",
					"markdown_inline",
					"diff",
					"python",
					--"org",
				},
				matchup = { enable = true },
				highlight = { enable = true },
				--indent = { enable = true },
			})
		end,
	},

	--[[
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {
			mode = "cursor",
		},
	},
	]]--
}
