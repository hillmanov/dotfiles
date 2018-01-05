"----------------------------------------------------- Plugins
" -----------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-obsession'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

Plug 'junegunn/vim-easy-align'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'gregsexton/MatchTag'
Plug 'tmhedberg/matchit'
Plug 'jremmen/vim-ripgrep'
Plug 'kshenoy/vim-signature' " Adds label in gutter for marks 
Plug 'wellle/targets.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mxw/vim-jsx'
Plug 'SirVer/ultisnips'
Plug 'AndrewRadev/sideways.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'google/vim-searchindex'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'w0rp/ale'
Plug 'easymotion/vim-easymotion'
Plug 'machakann/vim-highlightedyank'

call plug#end()            " required

" -----------------------------------------------------
" Moving around, searching and patterns
" ------------------------------------------------------
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set iskeyword-=.                " '.' is an end of word designator
set iskeyword-=#                " '#' is an end of word designator
set iskeyword-=-                " '-' is an end of word designator
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set inccommand=nosplit          " Live search and replace

" -----------------------------------------------------
" Displaying text
" -----------------------------------------------------
set guifont=FuraCode\ Nerd\ Font:h14
set encoding=utf8
set number                          " Line numbers on
set relativenumber              " Relative line numbers
set scrolloff=8                 " Minimum lines to keep above and below cursor
set nowrap                      " Don't wrap long lines Don't
set nocursorcolumn
set nocursorline
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Pipe in insert mode, block in others
set completeopt-=preview

" Automatically chanme the current directory
" Had to do it on insert enter. autochdir didn't work properly with path
" completion for some reason
autocmd InsertEnter * silent! lcd %:p:h
"
" -----------------------------------------------------
" Syntax, highlighting and spelling
" -----------------------------------------------------
syntax on
syntax sync minlines=256
autocmd BufEnter * :syn sync maxlines=500
if (has("termguicolors"))
 set termguicolors
endif

colorscheme gruvbox
"hi CursorLine guibg=#1d2021
"hi CursorLineNr guibg=#1d2021
" hi LineNr guibg=#1d2021
"hi DiffAdd guibg=#98c379 guifg=black gui=italic
"hi DiffDelete guibg=#e06c75 guifg=black
"hi DiffChange guibg=#61afef guifg=black
"hi DiffText guibg=#e5c07b guifg=black gui=italic

set background=dark
let g:gruvbox_italic = 1
let g:gruvbox_bold = 0
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_selection = 0

set autowrite "Checking to see if this will help remove some "nanny" messages
au BufNewFile,BufRead *.ejs set filetype=html " Treat ejs files like html for syntax highlighting

" -----------------------------------------------------
" Multiple windows
" -----------------------------------------------------
set hidden                      " Allow buffer switching without saving
set splitright                  " A new window is put right of the current one
set splitbelow                  " A new window is put below of the current one

" -----------------------------------------------------
" Using the mouse
" -----------------------------------------------------
set mouse=a "Enabled mouse for highlighting text
set mousehide "Hide mouse while characters are being typed

" -----------------------------------------------------
" Selecting text
" -----------------------------------------------------
set clipboard=unnamed

" -----------------------------------------------------
" Editing text
" -----------------------------------------------------
set showmatch                   " Show matching brackets/parenthesis
set selection=exclusive " $ will not select newline at the end of the line (v$ and d$)

" Don't indent promise chains (https://github.com/pangloss/vim-javascript/issues/467#issuecomment-247851078)
let g:javascript_opfirst = 1

set conceallevel=1

" -----------------------------------------------------
" Tabs and indenting
" -----------------------------------------------------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " use spaces instead of tabs.
set shiftround " tab / shifting moves to closest tabstop.
set smartindent " Intellegently dedent / indent new lines based on rules."

" -----------------------------------------------------
" Folding
" -----------------------------------------------------
set foldmethod=manual
set foldnestmax=1
set nofoldenable

" -----------------------------------------------------
" Mapping
" -----------------------------------------------------
set timeoutlen=350

" -----------------------------------------------------
" The swap file
" -----------------------------------------------------
set noswapfile " Turn off swp file creation

" -----------------------------------------------------
" Command line editing
" -----------------------------------------------------
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

" -----------------------------------------------------
" Various
" -----------------------------------------------------
scriptencoding utf-8

set undofile                                            " save central undo files
set undodir=~/.vim/tmp/undo/
set backup                                              " enable backups
set backupdir=~/.vim/tmp/backup/
set virtualedit=onemore                                 " Allow for cursor beyond last character
set nojoinspaces                                        " Don't add more spaces with joing lines with <S-J>
set shortmess=I                                         " Don't show the intro message on startup
"
" -----------------------------------------------------
" Key (re)mappings 
" -----------------------------------------------------

let g:mapleader = ' '
imap jk <Esc>
vmap jk <Esc>

noremap j gj
noremap k gk
noremap n nzz
noremap N Nzz

" Make Y act like D and C
noremap Y y$

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
nnoremap <expr> <Leader>rs ':%s/' . @/ . '//g<LEFT><LEFT>'
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

" Formated pasted text automatically
" nnoremap p p=`]

" Select pasted text
nnoremap gp `[v`]

" Adjust viewports to the same size
map <Leader>= <C-w>=

cmap w!! w !sudo tee > /dev/null %

nnoremap <Leader>w :w<cr>
nnoremap <Leader><Leader>n :!node %<cr>

autocmd FileType go nmap <leader><leader>b <Plug>(go-build)
autocmd FileType go nmap <leader><leader>r <Plug>(go-run)
autocmd FileType go nmap <leader><leader>t  <Plug>(go-test)

" gf work on node modules
set suffixesadd+=.js
set path+=$PWD/node_modules

" Search and replace in the file
nnoremap <Leader>h :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
vnoremap <Leader>h "hy:%s/<C-r>h//gc<left><left><left>
nmap <expr> M ':%s/' . @/ . '//g<left><left>'

" Search and replace in the files in the quickfix list
nnoremap <Leader>H :Qargs \| argdo %s/\<<C-r><C-w>\>//gc \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
vnoremap <Leader>H "hy:Qargs \| argdo %s/<C-r>h//gc \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Find project wide
" nnoremap <Leader><Leader>/ :ProjectRootExe Rg<space><C-r><C-w>
" vnoremap <Leader><Leader>/ "hy:ProjectRootExe Rg<space><C-r>h<space>

" vimrc edit and source
nnoremap <Leader>ev :e $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

let g:indent_guides_enable_on_vim_startup = 0


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

tnoremap jk <c-\><c-n>

" -----------------------------------------------------
" PLugin settings
" -----------------------------------------------------
" NERFTree customizations
map <C-n> :exe 'NERDTreeToggle ' . <SID>fzf_root()<CR>
nmap <Leader>nt :NERDTreeFind<CR>

let g:NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\~$', '\.swp$', '^\.git$','^node_modules$', '^\.DS_Store$']
let g:NERDTreeChDirMode=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMouseMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" FZF customizations" 
" This is the default extra key bindings
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }

" Normal mode completion
fun! s:fzf_root()
	let l:path = finddir('.git', expand('%:p:h').';')
	return fnamemodify(substitute(l:path, '.git', '', ''), ':p:h')
endfun

nnoremap <silent> <Leader>f :exe 'Files ' . <SID>fzf_root()<CR>

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


nnoremap <Leader>t :Find <C-r><C-w>
vnoremap <Leader>t "hy:Find '<C-r>h'

" Use rg instead of grep when using vimgrep
set grepprg=rg\ --vimgrep

autocmd! User FzfStatusLine call <SID>fzf_statusline()

function! s:buflist()
  redir => l:ls
  silent ls
  redir END
  return split(l:ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Start ieteractive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'gruvbox'
let g:airline_section_c = '%{fnamemodify(expand("%"), ":~:.")}'
let g:airline_section_x = '%{fnamemodify(getcwd(), ":t")}'
let g:airline_section_y = airline#section#create(['filetype'])

" Javascript library syntax highlighting settings
let g:used_javascript_libs = 'underscore,jquery,angularjs,chai,react'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = ';;'
let g:UltiSnipsJumpForwardTrigger = ';;'
let g:UltiSnipsJumpBackwardTrigger = '::'

" -----------------------------------------------------
" Helper functions
" -----------------------------------------------------
"
" -----------------------------------------------------
" Qargs - used for populating the args list with the filenames in the quickfix
" list
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let l:buffer_numbers = {}
  for l:quickfix_item in getqflist()
    let l:buffer_numbers[l:quickfix_item['bufnr']] = bufname(l:quickfix_item['bufnr'])
  endfor
  return join(values(l:buffer_numbers))
endfunction

function! Lebab()
    let l:winview = winsaveview()
    silent !lebab % -o % --transform arrow,let,arg-spread,obj-method,obj-shorthand,template
    call winrestview(l:winview)
endfunction
command! Lebab :call Lebab()

" " ALE config
" let g:ale_sign_column_always = 1
" let g:airline#extensions#ale#enabled = 1

" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \}
" noremap <Leader><Leader>f :ALEFix<CR>

augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" Sideways config
nnoremap <Leader><Leader>h :SidewaysLeft<cr>
nnoremap <Leader><Leader>l :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" use tab to forward cycle
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-d>"

" Enable jsx highlighting for .js files as well
let g:jsx_ext_required = 0

" tern and JavaScript
autocmd FileType javascript setlocal omnifunc=tern#Complete
let g:tern_map_prefix = '<Leader>'

" Use deoplete.
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable() " Lazy load deoplete - first time entering insert mode
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
nnoremap <Leader><Leader>d :TernDef<CR>
nnoremap <Leader><Leader>r :TernRename<CR>
nnoremap <Leader><Leader><Leader>r :TernRefs<CR>

" Go config 
let g:go_fmt_command = 'goimports' " Run goimports on save for go files. Also runs gofmt (which was replaced by goimports)
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_autosave = 1
let g:go_auto_sameids = 1


" Auto-Pairs
let g:AutoPairsMultilineClose = 0

" RipGrep
let g:rg_derive_root = 1

"Fix block cursor
augroup leavingVimStuff
 autocmd VimLeave * set guicursor=a:ver10-blinkon0
augroup END

