local g = vim.g

-- Set the global leader key to space
g.mapleader = " "

-- Set the local leader key to space
g.maplocalleader = " "

-- Instruct rg (ripgrep) to automatically derive the project root from the .git directory
g.rg_derive_root = 1

-- Highlight on yank: Setting up an autogroup and autocmd to highlight text when yanked
local yankAuGroup = vim.api.nvim_create_augroup('YankHighlight', { clear = true })  -- Create an augroup named 'YankHighlight', clearing it if it already exists
vim.api.nvim_create_autocmd('TextYankPost', {  -- Create an autocmd that triggers after text is yanked
  pattern = '*',  -- Apply the autocmd for all patterns
  group = yankAuGroup,  -- Use the 'YankHighlight' augroup
  command = 'silent! lua vim.highlight.on_yank {timeout=250}'  -- Run the on_yank function to highlight the yanked text, removing the highlight after 250ms
})
