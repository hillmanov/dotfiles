local opts = { noremap = true, silent = true }

local map = require("helpers").map

-- Escape insert and visual mode using "jk"
map("i", "jk", "<Esc>", opts)
map("v", "jk", "<Esc>", opts)

-- Move by visual lines, not actual lines
map("n", "j", "gj", opts)                    -- Move down by visual line
map("n", "k", "gk", opts)                    -- Move up by visual line

-- Yank to end of line
map("n", "Y", "y$", opts)                    -- Yank from cursor to end of line

-- Start editing after current word
map("n", "E", "ea", opts)

-- Go to the end of what was just pasted
map("v", "y", "y`]", opts)                   -- After yanking, go to end of yanked text
map("v", "p", "p`]", opts)                   -- After pasting in visual mode, go to end of pasted text
map("n", "p", "p`]", opts)                   -- After pasting in normal mode, go to end of pasted text

-- No highlight search and clear screen
map("n", "<c-l", ":<C-u>nohlsearch<CR><c-l>", opts)

-- Indent and de-indent while preserving visual selection
map("v", "<", "<gv", opts)                   -- Shift left and reselect
map("v", ">", ">gv", opts)                   -- Shift right and reselect
map("n", "=", "=gv", opts)                   

-- Switch between buffers
map("n", "<tab>", ":bn<CR>", opts)           -- Next buffer
map("n", "<s-tab>", ":bp<CR>", opts)         -- Previous buffer

-- Buffer and window management
map("n", "<leader>x", ":bd<CR>", opts)       -- Delete buffer
map("n", "<leader>c", "<C-w>q", opts)        -- Close window
map("n", "<leader>p", "$p", opts)            -- Paste at the end of the line

-- Replace current word with what is in the clipboard
map("n", "<leader>r", '"_diwP', opts)

-- Repeat last replacement of a word
map("n", "<leader>.", ':let @/=@"<cr>/<cr>cgn<c-r>.<esc>', opts)

-- Move lines up and down
map("n", "<C-j>", ":m .+1<CR>", opts)        -- Move line down
map("n", "<C-k>", ":m .-2<CR>", opts)        -- Move line up
map("v", "<C-k>", ":m '<-2<CR>gv", opts)     -- Move visual block up
map("v", "<C-j>", ":m '>+1<CR>gv", opts)     -- Move visual block down
map("i", "<C-j>", "<Esc>:m+<CR>gi", opts)    -- Move line down in insert mode
map("i", "<C-k>", "<Esc>:m-2<CR>gi", opts)   -- Move line up in insert mode

-- Format JSON with Python tool
map("n", "<leader><leader>j", ":%!python -m json.tool --indent 2<CR>", opts)
map("v", "<leader><leader>j", ":'<,'>!python -m json.tool --indent 2<CR>", opts)

-- Select pasted text
map("n", "gp", "`[v`]", opts)                -- Select last pasted text

-- Quick save
map("n", "<leader>w", ":w<CR>", opts)        -- Save current file

--AOC
map("n", "<leader>arc", ":make run-current<cr>", opts)

-- Search and replace in the file
map("n", "<leader>h", ":%s/<C-r><C-w>//c<Left><Left>", opts)   -- Search and replace the word under cursor in normal mode
map("v", "<leader>h", '"hy:%s/<C-r>h//c<left><left>', opts)    -- Search and replace the visually selected text

-- Quick fix file navigation
map("n", "<DOWN>", ":cprevious<CR>", opts)   -- Navigate to previous error
map("n", "<LEFT>", ":cnext<CR>", opts)       -- Navigate to next error

-- Terminal jk -> ESC mapping
map("t", "jk", "<c-\\><c-n>", opts)          -- Use "jk" to exit terminal mode

-- NvimTree settings
map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)       -- Toggle NvimTree
map("n", "<leader>nt", ":NvimTreeFindFile<CR>", opts) -- Find current file in NvimTree

-- Start EasyAlign in visual mode
map("v", "<Enter>", "<Plug>(EasyAlign)", opts)

-- Telescope config
map('n', '<leader>f', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)      -- Find files with telescope
map('n', '<leader>g', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)       -- Grep files with telescope
map('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)        -- List buffers with telescope
map('n', '<leader>n', '<cmd>lua require("telescope.builtin").file_browser()<cr>', opts)    -- Browse files with telescope

-- GitGutter plugin to undo last hunk
map('n', '<leader><leader>uh', '<Plug>(GitGutterUndoHunk)') 

-- Random mappings
map("n", "<leader><leader>n", ":!node %<cr>", opts)  -- Execute current file with Node.js

-- Code navigation
map("n", "gD", function()
  vim.lsp.buf.declaration()
end)

map("n", "gd", function()
  vim.lsp.buf.definition()
end)

map("n", "K", function()
  vim.lsp.buf.hover()
end)

map("n", "gi", function()
  vim.lsp.buf.implementation()
end)

map("n", "gr", function()
  vim.lsp.buf.references()
end)

map("n", "[d", function()
  vim.diagnostic.goto_prev()
end)

map("n", "d]", function()
  vim.diagnostic.goto_next()
end)

map('n', '<leader>rn', function() 
  vim.lsp.buf.rename()
end, opts)
