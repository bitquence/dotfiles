-- bitquence/ init_lua
-- Stolen from: too many people to list here

require('keybindings')
require('plugins')
require('options')
require('autocmds')
require('colorschemes')

-- TODO(fix): with my current configuration, packer never loads `config` hooks,
-- so I am sourcing all of my configuration files below
require('config.nvim-treesitter')
require('config.indent-blankline')
require('config.presence')
require('config.lsp.servers')
require('config.lsp.nvim-cmp')
