local opts = { 
  backup         = true,                -- Enable backup of the original file while editing
  backupdir      = os.getenv "HOME" .. "/.nvim/backup/",  -- Directory where backup files are stored
  clipboard      = "unnamedplus",             -- Use system clipboard
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
  cursorline     = true,                -- Highlight the current line
  number         = true,                -- Show line numbers
  relativenumber = true,                -- Show line numbers relative to the current line number
  scrolloff      = 8,                   -- Keep 8 lines visible above and below the cursor at all times
  selection      = "inclusive",         -- Don't select newline character when selecting line
  shiftround     = true,                -- Round indent to nearest multiple of 'shiftwidth'
  shiftwidth     = 2,                   -- Set the number of space characters inserted for indentation
  shortmess      = "ITF",               -- Shorten messages to avoid the hit-enter prompt
  showmatch      = true,                -- Show matching brackets
  signcolumn     = "yes",                -- Always show sign column (gutter, left of the line numbers)
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
  shell          = 'zsh',
  exrc           = true,
  -- cmdheight      = 0,
}


vim.g.python3_host_prog = '/usr/bin/python3'

for k, v in pairs(opts) do
  vim.opt[k] = v
end

-- Required to set this here to make yank/paste work over ssh. This is different from the clipboard option above, and both are needed.
local function in_ssh()
  return vim.env.SSH_CONNECTION ~= nil
end

if in_ssh() then
  vim.g.clipboard = {
    name = 'OSC52 only',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = function() return '' end, -- disable paste
      ['*'] = function() return '' end,
    },
  }
else
  vim.g.clipboard = {
    name = 'Xclip clipboard',
    copy = {
      ['+'] = { 'xclip', '-selection', 'clipboard', '-in' },
      ['*'] = { 'xclip', '-selection', 'primary', '-in' },
    },
    paste = {
      ['+'] = { 'xclip', '-selection', 'clipboard', '-out' },
      ['*'] = { 'xclip', '-selection', 'primary', '-out' },
    },
    cache_enabled = 1,
  }
end
