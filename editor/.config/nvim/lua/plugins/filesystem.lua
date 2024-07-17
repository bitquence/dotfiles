return {
	--[[
	{
		'nvim-pack/nvim-spectre',
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		dependencies = 'nvim-lua/plenary.nvim',
		keys = {
			{ "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
		},
	},
	]]--

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	},

	{
		'nvim-telescope/telescope.nvim',
		cmd = "Telescope",
		dependencies = {
			'nvim-telescope/telescope-live-grep-args.nvim',
			'nvim-lua/plenary.nvim',
		},
		keys = {
			--{ mode = { "n", "i", "v" }, "<C-t>", "<CMD>Telescope<CR>" },
			--{ mode = { "n", "i", "v" }, "<C-p>", "<CMD>Telescope find_files<CR>" },
			--{ mode = { "n", "i", "v" }, "<C-l>", "<CMD>Telescope live_grep<CR>" },
			--{ mode = { "n", "i", "v" }, "<C-c>", "<CMD>Telescope commands<CR>" },
			--{ mode = { "n", "i", "v" }, "<C-h>", "<CMD>Telescope command_history<CR>" },
			--{ mode = { "n", "i", "v" }, "<C-k>", "<CMD>Telescope keymaps<CR>" },
			--{ mode = { "n", "i", "v" }, "<C-s>", "<CMD>Telescope grep_string<CR>" },
			--{ mode = { "n", "i", "v" }, "<leader>rg", "<cmd>Telescope registers<cr>", desc = "Find registers" },
			--{ mode = { "n", "i", "v" }, "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
		},
		config = function()
			--vim.cmd [[autocmd User TelescopePreviewerLoaded setlocal number]]
			--require('telescope').setup({
			--	extensions = {
			--		['ui-select'] = {
			--			require('telescope.themes').get_dropdown {}
			--		}
			--	},
			--})
			--require("telescope").load_extension("ui-select")
		end
	},
}
