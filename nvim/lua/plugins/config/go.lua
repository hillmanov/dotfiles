local map = require("helpers").map
local g = vim.g

g.go_jump_to_error = 0

g.go_list_type = "quickfix"
g.go_fmt_command = "goimports"
g.go_fmt_fail_silently = 1

g.go_highlight_types = 1
g.go_highlight_fields = 1
g.go_highlight_functions = 1
g.go_highlight_methods = 1
g.go_highlight_operators = 1
g.go_highlight_build_constraints = 1
g.go_highlight_structs = 1
g.go_highlight_generate_tags = 1
g.go_highlight_space_tab_error = 0
g.go_highlight_array_whitespace_error = 0
g.go_highlight_trailing_whitespace_error = 0
g.go_highlight_extra_types = 1
g.go_def_mapping_enabled = 0 -- We'll use the language server instead for go to def stuff

-- automatically highlight variable your cursor is on
g.go_auto_sameids = 0

-- Golang settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"go"},
  callback = function()
    map('n', '<leader><leader>b','<Plug>(go-build)')
    map('n', '<leader><leader>r','<Plug>(go-run)')
    map('n', '<leader><leader>t','<Plug>(go-test)')
  end,
})
g.go_rename_command = 'gopls'
g.go_def_mode='gopls'
g.go_info_mode='gopls'

