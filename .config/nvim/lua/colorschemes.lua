local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- Seoul256
g.seoul256_background = 234 -- Range (for dark mode): 233 (darkest) ~ 239 (lightest)

-- Sonokai
g.sonokai_style = "espresso" -- {andromeda,default,espresso}
g.sonokai_diagnostic_virtual_text = 1 -- Enable colored error messages

cmd('colorscheme ayu')
