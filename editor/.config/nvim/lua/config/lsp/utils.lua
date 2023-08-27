local set = vim.keymap.set
local lsp_utils = {}

function lsp_utils.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	return require('cmp_nvim_lsp').update_capabilities(capabilities)
end

function lsp_utils.keybinds()
	local opts = { noremap = true }

	--nkeymap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
	--nkeymap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>') nkeymap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
	--nkeymap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	--nkeymap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
	--nkeymap('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	--nkeymap('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	--nkeymap('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	--nkeymap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
	--nkeymap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
	--nkeymap('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	--nkeymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	--nkeymap('<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

	-- TODO: update shortcuts
	set('n', 'gd', vim.lsp.buf.definition, opts)
	set('n', 'gD', vim.lsp.buf.declaration, opts)
	set('n', 'gi', vim.lsp.buf.implementation, opts)
	set('n', 'gw', vim.lsp.buf.document_symbol, opts)
	set('n', 'gw', vim.lsp.buf.workspace_symbol, opts)
	set('n', 'gr', vim.lsp.buf.references, opts)
	set('n', 'gt', vim.lsp.buf.type_definition, opts)
	set('n', 'K', vim.lsp.buf.hover, opts)
	set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	set('n', '<Leader>k', function()
		vim.diagnostic.open_float(0, {scope="line"})
	end, opts)
	set('n', '<Leader>af', vim.lsp.buf.code_action, opts)
	set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
end

return lsp_utils
