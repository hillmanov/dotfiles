-- LSP capabilities from nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Centralized LSP on_attach handler
-- Keymaps are defined in mappings.lua (using Lspsaga where available)
local on_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
end

-- GoLang
vim.lsp.config.gopls = {
  cmd = { 'gopls' },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
}

-- TypeScript / JavaScript
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "tsconfig.json", "package.json", ".git" },
}

-- TailwindCSS
vim.lsp.config.tailwindcss = {
  cmd = { "tailwindcss-language-server", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" },
}

-- Enable language servers
vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('tailwindcss')
