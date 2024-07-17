return {
	{
		'wakatime/vim-wakatime',
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		'andweeb/presence.nvim',
		opts = {
			main_image = "file", -- Main image display (either "neovim" or "file")
			neovim_image_text =  "⚠️ this user cannot exit vim", -- Text displayed when hovered d over the Neovim image
		},
		event = { "BufReadPost", "BufNewFile" },
	},
}
