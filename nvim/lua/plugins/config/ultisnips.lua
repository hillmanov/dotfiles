-- Not even sure if I need this...
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'javascript,javascriptreact,typescript,typescriptreact',
  command = 'UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact'
})

