local g = vim.g

g.UltiSnipsSnippetDirectories = { os.getenv "HOME" .. "/.config/nvim/UltiSnips" }
g.UltiSnipsExpandTrigger = ';;'
g.UltiSnipsJumpForwardTrigger = ';;'
g.UltiSnipsJumpBackwardTrigger = '::'

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'javascript,javascriptreact,typescript,typescriptreact',
  command = 'UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact'
})

