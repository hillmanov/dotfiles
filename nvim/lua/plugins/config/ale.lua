vim.g.ale_fixers = {
  javascript = {"prettier"},
  ["javascript.jsx"] = {"prettier"},
  typescript = {"prettier"},
  ["typescript.tsx"] = {"prettier"},
  css = {"prettier"},
  scss = {"prettier"}
}

vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_filetype_changed = 0
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_disable_lsp = 1
