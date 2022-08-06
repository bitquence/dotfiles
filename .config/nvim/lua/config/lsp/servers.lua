local nvim_lsp = require('lspconfig')
local lsp_utils = require('config.lsp.utils')

local capabilities = lsp_utils.capabilities()

local function on_attach(client, buf)
	lsp_utils.keybinds()
end

nvim_lsp['rust_analyzer'].setup {
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

nvim_lsp['pyright'].setup {
	on_attach = on_attach,
	capabilities = capabilities
}

nvim_lsp['gopls'].setup {
	on_attach = on_attach,
	capabilities = capabilities
}

--nvim_lsp['solang'].setup {
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
