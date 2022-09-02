local cmp = require('cmp')

-- Stolen from https://git.icyphox.sh/dotfiles/tree/config/nvim/lua/completion.lua
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
	-- Required in order to suppress errors
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		--['<C-b>'] = cmp.mapping.scroll_docs(-4),
		--['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_next_item()
		  --elseif luasnip.expand_or_jumpable() then
			--luasnip.expand_or_jump()
		  elseif has_words_before() then
			cmp.complete()
		  else
			fallback()
		  end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_prev_item()
		  --elseif luasnip.jumpable(-1) then
			--luasnip.jump(-1)
		  else
			fallback()
		  end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{name="nvim_lsp"}
        --{ name = 'nvim_lsp', max_item_count = 10 },
        --{ name = 'buffer', max_item_count = 10 },
	})
}

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})


