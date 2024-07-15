return {
	{
		'itchyny/lightline.vim',
		config = function()
			vim.cmd([[
				let g:lightline = {
				\ 'mode_map': {
				\ 'n' : 'Normal',
				\ 'i' : 'Insert',
				\ 'R' : 'Replace',
				\ 'v' : 'Visual',
				\ 'V' : 'Visual-line',
				\ "\<C-v>": 'Visual-block',
				\ 's' : 'Select',
				\ 'S' : 'Select-line',
				\ 'c': 'Command',
				\ "\<C-s>": 'Select-block',
				\ 't': 'Terminal',
				\ },
				\ }
				]])
		end
	},

	--[[
	{
		-- TODO: configure @ https://github.com/folke/noice.nvim
		'folke/noice.nvim',
		event = "VeryLazy",
		dependencies = {
		    'rcarriga/nvim-notify',
		    'MunifTanjim/nui.nvim',
		},
		config = function()
			require("noice").setup({
				presets = {
					    bottom_search = true, -- use a classic bottom cmdline for search
						command_palette = true, -- position the cmdline and popupmenu together
						long_message_to_split = true, -- long messages will be sent to a split
						inc_rename = false, -- enables an input dialog for inc-rename.nvim
						lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				popupmenu = {
					enabled = false, -- enables the Noice popupmenu UI
				},
			})
		end
	},

	{
		'nvim-lualine/lualine.nvim',
		enabled = false
	},

	{
		'stevearc/dressing.nvim',
		opts = {
			-- When true, <Esc> will close the modal
			insert_only = true,
			-- When true, input will start in insert mode.
			start_in_insert = true,
		},
		--enabled = false,
	},

	{
		'rcarriga/nvim-notify',
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},
	]]--
}
