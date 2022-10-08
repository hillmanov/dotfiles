local opts = { noremap = true, silent = true }

local map = require("helpers").map


imap jk <Esc>
vmap jk <Esc>

noremap j gj
noremap k gk

" Make Y act like D and C
noremap Y y$

" Start editing after current w
noremap E ea


nnoremap [[ ?{<CR>w99[{:nohlsearch<CR>
nnoremap ]] j0[[%/{<CR>:nohlsearch<CR>

" Go to the end of what was just pasted.
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
nnoremap <silent> <c-l> :<C-u>nohlsearch<cr><c-l>

vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
noremap <Leader>x :bd<CR>
noremap <Leader>c <C-w>q
noremap <Leader>p $p

" Replace current word with what is in the clipboard
nnoremap <Leader>r "_diwP

" Repeat last replacement of a word
nnoremap <leader>. :let @/=@"<cr>/<cr>cgn<c-r>.<esc>

" Move lines around with Ctrl j and k in any mode
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>
vnoremap <C-j> :m '>+1<CR>gv
vnoremap <C-k> :m '<-2<CR>gv
inoremap <C-j> <Esc>:m+<CR>gi
inoremap <C-k> <Esc>:m-2<CR>gi

" Format json
nnoremap <Leader><Leader>j :%!python -m json.tool<CR>
vnoremap <Leader><Leader>j :'<,'>!python -m json.tool<CR>

" Select pasted text
nnoremap gp `[v`]

nnoremap <Leader>w :w<cr>
nnoremap <Leader><Leader>n :!node %<cr>

"AOC
nnoremap <Leader>arc :make run-current<cr>

" Poor attempt at moving words to the left or right
nnoremap <Leader><Leader>wl dawea <ESC>pxb
nnoremap <Leader><Leader>wh dawbPa <ESC>bhx



" Search and replace in the file
nnoremap <Leader>h :%s/\<<C-r><C-w>\>//c<Left><Left>
vnoremap <Leader>h "hy:%s/<C-r>h//c<left><left>

" vimrc edit and source
nnoremap <Leader>ev :e $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>



" Permanent magic regex mode
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" Quick fix file navigation
nmap <silent> <DOWN> :cprevious<CR> " j/k style navigation on my keyboard
nmap <silent> <LEFT> :cnext<CR>

" Terminal jk -> ESC mapping
tnoremap jk <c-\><c-n>



map <C-n> :exe 'NERDTreeToggle ' . <SID>project_root()<CR>
nmap <Leader>nt :NERDTreeFind<CR>


" Start ieteractive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)


" ALE config
noremap <Leader><Leader>f :ALEFix<CR>


" COC settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

