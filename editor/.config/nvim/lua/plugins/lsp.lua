return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate",
				config = true,
			},
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						'rust_analyzer',
						'clangd',
						'lua_ls',
						'pyright',
					}
				},
			},
			{
				"folke/neodev.nvim",
				config = true,
				-- TODO: fix this silly goofy little plugin
				enabled = false,
				--opts = {
				--	debug = true,
				--	experimental = {
				--		pathStrict = true,
				--	},
				--},
			},
		},
		keys = {},
		--opts = {
		--	diagnostics = {
		--		icons = true,
		--		underline = true,
		--		update_in_insert = false,
		--		virtual_text = {
		--			spacing = 4,
		--			source = "if_many",
		--			prefix = "●",
		--		},
		--		severity_sort = true,
		--	},
		--},
		--opts = {
		--	servers = {
		--		clangd = {},
		--		lua_ls = {},
		--		rust_analyzer = {},
		--	},
		--	setup = {
		--		["*"] = function(server, opts) end,
		--	}
		--},
		config = function()
			local lspconfig = require('lspconfig')
			local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
			local mason_lspconfig = require('mason-lspconfig')

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = lsp_capabilities,
					})
				end,
			})
		end
	},

	{
		"folke/trouble.nvim",
		opts = {
			icons = false,
			cycle_results = false,
			--auto_preview = false,
		},
	},

	--[[
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.selene,
					--null_ls.builtins.diagnostics.eslint,
					--null_ls.builtins.completion.spell,
				},
			})
		end,
		enabled = false,
	},

	'cespare/vim-toml',
	'nvim-lua/lsp_extensions.nvim',
	'tomlion/vim-solidity',
	'fatih/vim-go',
	]]--
}
