local lsp_config = require('lspconfig')
local lsp_utils = require('config.lsp.utils')

local capabilities = lsp_utils.capabilities()

local function on_attach(client, buf)
	lsp_utils.keybinds(buf)
end

lsp_config['rust_analyzer'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
	-- settings = {
	--   ["rust-analyzer"] = {
	--     cargo = {
	--       allFeatures = true,
	--     },
	--     completion = {
	--         postfix = {
	--           enable = false,
	--         },
	--     },
	--   },
	-- },
}

lsp_config['pyright'].setup {
	on_attach = on_attach,
	capabilities = capabilities
}

lsp_config['gopls'].setup {
	on_attach = on_attach,
	capabilities = capabilities
}

--lsp_config['solang'].setup {
--  on_attach = on_attach,
--  capabilities = capabilities
--}

--require('rust-tools').setup {
--	tools = {
--		inlay_hints = {
--			other_hints_prefix = "➞"
--		}
--	}
--}
