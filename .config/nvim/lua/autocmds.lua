local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight text that is yanked
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end
})

-- Don't add a comment on newline
--autocmd('BufEnter', {
--  pattern = '*',
--  command = 'set fo-=c fo-=r fo-=o'
--})
