require('nvim-treesitter.configs').setup {
	ensure_installed = { "rust", "lua", "vim", "solidity", "c", "go", "json", "markdown", "python" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	}
}
