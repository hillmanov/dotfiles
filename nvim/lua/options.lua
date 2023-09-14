local opts = { 
  backup         = true,                -- Enable backup of the original file while editing
  backupdir      = os.getenv "HOME" .. "/.nvim/backup/",  -- Directory where backup files are stored
  clipboard      = "unnamedplus",       -- Use system clipboard
  completeopt    = "menu,noselect",     -- Completion option "menu" to see completion menu, "noselect" to prevent auto selecting the first item
  conceallevel   = 1,                   -- Set conceal level to hide certain text based on syntax (e.g., markdown)
  expandtab      = true,                -- Use spaces instead of tabs when indenting
  foldenable     = false,               -- Disable code folding
  foldmethod     = "manual",            -- Set folding method as manual
  foldnestmax    = 1,                   -- Set maximum fold nesting depth to 1
  gdefault       = true,                -- Replace all instances on a line by default ( not need to add g  flag)
  grepprg        = "rg\\",              -- Use ripgrep for :vimgrep
  hidden         = true,                -- Allow buffer switching without saving
  ignorecase     = true,                -- Case insensitive search
  lazyredraw     = true,                -- Don't redraw while executing macros
  mouse          = "",                  -- Disable mouse support in all modes
  nocursorcolumn = true,                -- Do not highlight the screen column of the cursor
  nojoinspaces   = true,                -- No double spaces with join
  noswapfile     = true,                -- Disable swap file to avoid creating swap files for changes
  number         = true,                -- Show line numbers
  relativenumber = true,                -- Show line numbers relative to the current line number
  scrolloff      = 8,                   -- Keep 8 lines visible above and below the cursor at all times
  selection      = "exclusive",         -- Don't select newline character when selecting line
  shiftround     = true,                -- Round indent to nearest multiple of 'shiftwidth'
  shiftwidth     = 2,                   -- Set the number of space characters inserted for indentation
  shortmess      = "ITF",               -- Shorten messages to avoid the hit-enter prompt
  showmatch      = true,                -- Show matching brackets
  slitright      = true,                -- Vertically split windows are right-aligned
  smartcase      = true,                -- Case sensitive when uc present
  smartindent    = true,                -- Smart autoindenting when starting a new line
  swapfile       = false,               -- Disable swap file creation
  softtabstop    = 2,                   -- Set number of columns for a tab character while editing
  splitbelow     = true,                -- Split windows will be below the current window
  tabstop        = 2,                   -- Set number of spaces a <Tab> in the text stands for
  termguicolors  = true,                -- Use GUI colors instead of terminal colors
  timeoutlen     = 200,                 -- Time in milliseconds to wait for a mapped sequence to complete
  undodir        = os.getenv "HOME" .. "/.nvim/undo/",  -- Directory to save undo files
  undofile       = true,                -- Preserve undo history between sessions by using an undo file
  virtualedit    = "onemore",           -- Allow cursor to go past the end of the line
  whichwrap      = "b,s,h,l,<,>,[,]",   -- Allow certain keys to wrap around lines
  wildmode       = "list:longest,full", -- Define how command-line completion works
  wrap           = false,               -- Disable line wrapping
  guicursor      = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,i-r-sm:blinkwait175-blinkoff150-blinkon175-Cursor/lCursor", -- Set cursor shape and blink settings in different modes
}

for k, v in pairs(opts) do
  vim.o[k] = v
end
