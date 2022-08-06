local lsp_utils = {}

function lsp_utils.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	return require('cmp_nvim_lsp').update_capabilities(capabilities)
end

function lsp_utils.keybinds(buf)
	local opts = { buffer = buf, noremap = true }

	--nkeymap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
	--nkeymap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
	--nkeymap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
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
	vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
	vim.api.nvim_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
	vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
	vim.api.nvim_set_keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
	vim.api.nvim_set_keymap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
	vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<cr>', opts)
	vim.api.nvim_set_keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
	vim.api.nvim_set_keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.api.nvim_set_keymap('n', '<Leader>k', ':lua vim.diagnostic.open_float(0, {scope="line"})<cr>', opts)
	vim.api.nvim_set_keymap('n', '<Leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
	vim.api.nvim_set_keymap('n', '<Leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)
end

return lsp_utils
