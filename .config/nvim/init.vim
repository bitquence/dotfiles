" TODO: Migrate from Vim script to Lua

map <Space> <Leader>

" Vim-plug configuration {{
call plug#begin('~/local/share/nvim/plugged')

" Miscellaneous
"Plug 'wakatime/vim-wakatime'
"Plug 'terryma/vim-expand-region'
"Plug 'andymass/vim-matchup'
"Plug 'justinmk/vim-sneak'
Plug 'andweeb/presence.nvim' " Discord rich presence

" Visual improvements
"Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine' " Vertical indentation lines
Plug 'itchyny/lightline.vim' " Improved status line

" Fuzzy file finding
"Plug 'nvim-telescope/telescope.nvim' 

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/sonokai'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'

" Language support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"Plug 'williamboman/nvim-lsp-installer' " Language server installer
"Plug 'neoclide/coc.nvim', {'branch': 'release'} 

" Snippets (required by nvim-lsp)
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

" Language support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
"Plug 'simrat39/rust-tools.nvim'
"Plug 'nvim-lua/lsp_extensions.nvim'
"Plug 'fatih/vim-go'
"Plug 'tomlion/vim-solidity'

call plug#end()
" }}

lua << EOF

-- treesitter.lua
require('nvim-treesitter.configs').setup {
	ensure_installed = { "rust", "vim", "solidity", "c", "go", "json", "markdown", "python" },
  highlight = {
    enable = true,
    --additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  }
}

-- cmp.lua
local cmp = require('cmp')

cmp.setup {
  -- Required in order to suppress errors
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ['<Tab'] = cmp.mapping.confirm({ select = true }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
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

-- nvim_lsp.lua
local lsp_config = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function nkeymap(key, map)
  vim.api.nvim_set_keymap('n', key, map, { noremap = true })
end

local on_attach = function(client)
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
  nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
  nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
  nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
  nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
  nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
  nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
  nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
  nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
  nkeymap('<C-k>', ':lua vim.lsp.buf.signature_help()<cr>')
  nkeymap('<Leader>k', ':lua vim.diagnostic.open_float(0, {scope="line"})<cr>')
  nkeymap('<Leader>af', ':lua vim.lsp.buf.code_action()<cr>')
  nkeymap('<Leader>rn', ':lua vim.lsp.buf.rename()<cr>')
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

EOF

" IndentLine configuration {{
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
" }}

" Lightline configuration {{
let g:lightline = {'colorscheme': 'powerline', 'background': 'dark'}
" }}

" Seoul256.vim configuration {{
let g:seoul256_background = 234
let g:seoul256_srgb = 1
" }}

" Sonokai configuration {{
let g:sonokai_style = "espresso" " andromeda | default | espresso
let g:sonokai_diagnostic_virtual_text = 1 " Enable colored error messages
" }}

" Sneak.vim configuration {{
"let g:sneak#label = 1
"map <Leader>s <Plug>Sneak_s
"map <Leader>S <Plug>Sneak_S
" }}

" Rust-Tools configuration (inlay hints on <Ldr>T) {{
"nnoremap <Leader>T :lua require('').inlay_hints()<cr>
" }}

set tabstop=4 softtabstop=4 " Set width of tab character
set shiftwidth=4 " Set width of tab character in normal mode
set autoindent " Automatically indent on newline
set smartindent " Smart indentation

set termguicolors " Enable terminal true colors
set mouse=a " Enable use of mouse controls in all modes (iTerm2)
set relativenumber number " Set hybrid relative line numbers
set noshowmode " Disables last mode indication (we are using lightline)
set colorcolumn=80 " Start highlighting at 80 characters
set textwidth=0 " Do not insert a line break at 80 characters automatically
set scrolloff=8 " Set the number of lines to keep the cursor over or under
"set nohlsearch " Do not highlight results of a search
set cursorline " Highlight the line the cursor is currently only
set wildmenu wildmode=full " Enable autocompletion and show menu at full length
set wildignorecase " Ignore case when autocompleting files
set ignorecase " Ignore case when autocompleting commands

colorscheme ayu " Apply color scheme

" Map Shift-Tab to inverse tab (TODO: learn other shortcut)
"nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

"syntax enable " Enable syntax highlighting

