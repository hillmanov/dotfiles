local cmd = vim.cmd

local opts = {
  ignorecase     = true, -- Case insensitive search
  smartcase      = true, -- Case sensitive when uc present
  number         = true,
  relativenumber = true,
  scrolloff      = 8,
  wrap           = false,
  nocursorcolumn = true,
  cursorline     = true,
  completeopt    = "menu,noselect", -- "Maybe just preview?
  lazyredraw     = true, -- "Don't redraw while executing macros
  gdefault       = true, -- Replace all instances on a line by default ( not need to add g  flag)
  whichwrap      = "b,s,h,l,<,>,[,]",   -- Backspace and cursor keys wrap too
  slitright      = true,
  splitbelow     = true,
  mouse          = "",
  hidden         = true, -- Allow buffer switching without saving
  clipboard      = "unnamedplus", -- Use system clipboard
  showmatch      = true, -- Show matching brackets
  selection      = "exclusive", -- Don't select newline character when selecting line
  conceallevel   = 1,
  tabstop        = 2,
  shiftwidth     = 2,
  softtabstop    = 2,
  expandtab      = true,
  shiftround     = true,
  smartindent    = true,
  termguicolors  = true,
  foldmethod     = "manual",
  foldnestmax    = 1,
  foldenable     = false,
  timeoutlen     = 200, -- Might need to go up to 250
  noswapfile     = true,
  wildmode       = "list:longest,full",
  undofile       = true,
  undodir        = os.getenv "HOME" .. "/.nvim/undo/",
  backup         = true,
  backupdir      = os.getenv "HOME" .. "/.nvim/backup/",
  virtualedit    = "onemore", -- All cursor to go past the end of the the last character
  nojoinspaces   = true, -- No double spaces with join
  shortmess      = "ITF",
}

for k, v in pairs(opts) do
  vim.o[k] = v
end

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout=250}
  augroup end
]]