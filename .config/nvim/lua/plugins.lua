vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Miscellaneous
	--use {
	--	'wakatime/vim-wakatime',
	--	'terryma/vim-expand-region',
	--	'andymass/vim-matchup',
	--	'justinmk/vim-sneak',
	--}
	use {
		'andweeb/presence.nvim', -- Discord rich presence
		config = function()
			require('config.presence')
		end 
	}

	-- Fuzzy file finding
	--use {
	--	'nvim-telescope/telescope.nvim' 
	--}

	-- Cosmetic improvements
	use {
		--'ryanoasis/vim-devicons',
		--{
		--	'lukas-reineke/indent-blankline.nvim',
		--	config = function()
		--		require('config.indent-blankline')
		--	end
		--},
		'itchyny/lightline.vim',
		'nvim-treesitter/nvim-treesitter-context'
	}

	-- Themes
	use {
		'junegunn/seoul256.vim',
		'sainnhe/sonokai',
		'ayu-theme/ayu-vim',
		'morhetz/gruvbox'
	}

	-- Language support
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('config.nvim-treesitter')
		end
	}

	use {
		{
			'neovim/nvim-lspconfig',
			requires = {
				-- Snippets are required by nvim-lsp
				'hrsh7th/vim-vsnip',
				'hrsh7th/cmp-vsnip',
			},
			config = function()
				require('config.lsp.servers')
			end
		},
		{
			'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline'
			},
			config = function()
				require('config.lsp.nvim-cmp')
			end
		},
	}

	use {
		'cespare/vim-toml',
		'rust-lang/rust.vim',
		'fatih/vim-go',
		--'simrat39/rust-tools.nvim',
		--'nvim-lua/lsp_extensions.nvim',
		--'tomlion/vim-solidity',
	}
end)
