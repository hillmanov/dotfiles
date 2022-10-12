local opts = {
  backup         = true,
  backupdir      = os.getenv "HOME" .. "/.nvim/backup/",
  clipboard      = "unnamedplus", -- Use system clipboard
  completeopt    = "menu,noselect", -- "Maybe just preview?
  conceallevel   = 1,
  cursorline     = true,
  expandtab      = true,
  foldenable     = false,
  foldmethod     = "manual",
  foldnestmax    = 1,
  gdefault       = true, -- Replace all instances on a line by default ( not need to add g  flag)
  grepprg        = "rg\\", --vimgrep
  hidden         = true, -- Allow buffer switching without saving
  ignorecase     = true, -- Case insensitive search
  lazyredraw     = true, -- "Don't redraw while executing macros
  mouse          = "",
  nocursorcolumn = true,
  nojoinspaces   = true, -- No double spaces with join
  noswapfile     = true,
  number         = true,
  relativenumber = true,
  scrolloff      = 8,
  selection      = "exclusive", -- Don't select newline character when selecting line
  shiftround     = true,
  shiftwidth     = 2,
  shortmess      = "ITF",
  showmatch      = true, -- Show matching brackets
  slitright      = true,
  smartcase      = true, -- Case sensitive when uc present
  smartindent    = true,
  swapfile       = false,
  softtabstop    = 2,
  splitbelow     = true,
  tabstop        = 2,
  termguicolors  = true,
  timeoutlen     = 200, -- Might need to go up to 250
  undodir        = os.getenv "HOME" .. "/.nvim/undo/",
  undofile       = true,
  virtualedit    = "onemore", -- All cursor to go past the end of the the last character
  whichwrap      = "b,s,h,l,<,>,[,]",   -- Backspace and cursor keys wrap too
  wildmode       = "list:longest,full",
  wrap           = false,
}

for k, v in pairs(opts) do
  vim.o[k] = v
end
