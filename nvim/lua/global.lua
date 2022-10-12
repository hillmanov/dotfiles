local g = vim.g

g.mapleader = " "
g.rg_derive_root = 1


-- Highlight on yank
local yankAuGroup = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = yankAuGroup,
  command = 'silent! lua vim.highlight.on_yank {timeout=250}'
})
