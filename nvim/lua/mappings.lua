local opts = { noremap = true, silent = true }

local map = require("helpers").map

map("i", "jk", "<Esc>", opts)
map("v", "jk", "<Esc>", opts)

map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

map("n", "Y", "y$", opts)

-- Start editing after current w
map("n", "E", "ea", opts)

-- Go to the end of what was just pasted.
map("v", "y", "y`]", opts)
map("v", "p", "p`]", opts)
map("n", "p", "p`]", opts)
map("n", "<c-l", ":<C-u>nohlsearch<CR><c-l>", opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "=", "=gv", opts)

map("n", "<tab>", ":bn<CR>", opts)
map("n", "<s-tab>", ":bp<CR>", opts)
map("n", "<leader>x", ":bd<CR>", opts)
map("n", "<leader>c", "<C-w>q", opts)
map("n", "<leader>p", "$p", opts)

-- Replace current word with what is in the clipboard
map("n", "<leader>r", '"_diwP', opts)

-- Repeat last replacement of a word
map("n", "<leader>.", ':let @/=@"<cr>/<cr>cgn<c-r>.<esc>', opts)

-- Move lines around with Ctrl j and k in any mode
map("n", "<C-j>", ":m .+1<CR>", opts)
map("n", "<C-k>", ":m .-2<CR>", opts)
map("v", "<C-k>", ":m '<-2<CR>gv", opts)
map("v", "<C-j>", ":m '>+1<CR>gv", opts)
map("i", "<C-j>", "<Esc>:m+<CR>gi", opts)
map("i", "<C-k>", "<Esc>:m-2<CR>gi", opts)

-- Format json
map("n", "<leader><leader>j", ":%!python -m json.tool<CR>", opts)
map("v", "<leader><leader>j", ":'<,'>!python -m json.tool<CR>", opts)

-- Select pasted text
map("n", "gp", "`[v`]", opts)

map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader><leader>n", ":!node %<cr>", opts)

--AOC
map("n", "<leader>arc", ":make run-current<cr>", opts)


-- Search and replace in the file
map("n", "<leader>h", ":%s/<C-r><C-w>//c<Left><Left>", opts)
map("v", "<leader>h", '"hy:%s/<C-r>h//c<left><left>', opts)

-- vimrc edit and source
-- nnoremap <leader>ev :e $MYVIMRC<cr>
-- nnoremap <leader>sv :source $MYVIMRC<cr>

-- Quick fix file navigation
map("n", "<DOWN>", ":cpreviews<CR>", opts)
map("n", "<LEFT>", ":cnext<CR>", opts)

-- Terminal jk -> ESC mapping
map("t", "jk", "<c-\\><c-n>", opts)

map("n", "<C-n>", ":NERDTreeToggle<CR>", opts)
map("n", "<leader>nt", ":NERDTreeFind<CR>", opts)

-- Start ieteractive EasyAlign in visual mode (e.g. vip<Enter>)
map("v", "<Enter>", "<Plug>(EasyAlign)", opts)

-- ALE config
map("n", "<leader><leader>f", ":ALEFix<CR>", opts)

-- Telescope config
map('n', '<leader>f', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>g', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>n', '<cmd>lua require("telescope.builtin").file_browser()<cr>', opts)

-- COC settings
-- nmap <silent> gd <Plug>(coc-definition)
-- nmap <silent> gy <Plug>(coc-type-definition)
-- nmap <silent> gi <Plug>(coc-implementation)
-- nmap <silent> gr <Plug>(coc-references)
-- nmap <leader>rn <Plug>(coc-rename)

