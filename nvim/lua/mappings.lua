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
map("n", "<S-tab>", ":bp<CR>", opts)
map("n", "<Leader>x", ":bd<CR>", opts)
map("n", "<Leader>c", "<C-w>q", opts)
map("n", "<Leader>p", "$p", opts)

-- Replace current word with what is in the clipboard
map("n", "<Leader>r", '"_diwP', opts)

-- Repeat last replacement of a word
map("n", "<Leader>.", ':let @/=@"<cr>/<cr>cgn<c-r>.<esc>', opts)

-- Move lines around with Ctrl j and k in any mode
map("n", "<C-j>", ":m .+1<CR>", opts)
map("n", "<C-k>", ":m .-2<CR>", opts)
map("v", "<C-k>", ":m '<-2<CR>gv", opts)
map("v", "<C-j>", ":m '>+1<CR>gv", opts)
map("i", "<C-j>", "<Esc>:m+<CR>gi", opts)
map("i", "<C-k>", "<Esc>:m-2<CR>gi", opts)

-- Format json
map("n", "<Leader><Leader>j", ":%!python -m json.tool<CR>", opts)
map("v", "<Leader><Leader>j", ":'<,'>!python -m json.tool<CR>", opts)

-- Select pasted text
map("n", "gp", "`[v`]", opts)

map("n", "<Leader>q", ":w<CR>", opts)
map("n", "<Leader><Leader>n", ":!node %<cr>", opts)

--AOC
map("n", "<Leader>arc", ":make run-current<cr>", opts)


-- Search and replace in the file
map("n", "<Leader>h", ":%s/<C-r><C-w>//c<Left><Left>", opts)
map("v", "<Leader>h", '"hy:%s/<C-r>h//c<left><left>', opts)

-- vimrc edit and source
-- nnoremap <Leader>ev :e $MYVIMRC<cr>
-- nnoremap <Leader>sv :source $MYVIMRC<cr>

-- Quick fix file navigation
map("n", "<DOWN>", ":cpreviews<CR>", opts)
map("n", "<LEFT>", ":cnext<CR>", opts)

-- Terminal jk -> ESC mapping
map("t", "jk", "<c-\\><c-n>", opts)

map("n", "<C-n>", ":NERDTreeToggle<CR>", opts)
map("n", "<Leader>nt", ":NERDTreeFind<CR>", opts)

-- Start ieteractive EasyAlign in visual mode (e.g. vip<Enter>)
map("v", "<Enter>", "<Plug>(EasyAlign)", opts)

-- ALE config
map("n", "<Leader><Leader>f", ":ALEFix<CR>", opts)


-- COC settings
-- nmap <silent> gd <Plug>(coc-definition)
-- nmap <silent> gy <Plug>(coc-type-definition)
-- nmap <silent> gi <Plug>(coc-implementation)
-- nmap <silent> gr <Plug>(coc-references)
-- nmap <leader>rn <Plug>(coc-rename)
