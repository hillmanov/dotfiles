-- Share snippets across JavaScript/TypeScript file types
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'javascript,javascriptreact,typescript,typescriptreact',
  command = 'UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact'
})

