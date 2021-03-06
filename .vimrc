"----------------------------------------------------- Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-projectionist' " Jump to alternate files quickly. 

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'

Plug 'andymass/vim-matchup'

Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'kshenoy/vim-signature' " Adds label in gutter for marks
Plug 'wellle/targets.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'brooth/far.vim'
Plug 'qpkorr/vim-renamer'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'vimwiki/vimwiki'
Plug 'mbbill/undotree'
Plug 'rust-lang/rust.vim'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}

call plug#end()            

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
set guifont=FiraCode\ Nerd\ Font:h12
set encoding=utf8
set number                          " Line numbers on
set relativenumber              " Relative line numbers
set scrolloff=8                 " Minimum lines to keep above and below cursor
set nowrap                      " Don't wrap long lines Don't
set nocursorcolumn
set cursorline
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Pipe in insert mode, block in others
set completeopt-=preview
" Automatically chanme the current directory
" Had to do it on insert enter. autochdir didn't work properly with path
" completion for some reason
autocmd InsertEnter * silent! lcd %:p:h
set lazyredraw                 " don't update the display while executing macros
set gdefault " Replace all instances on a line by default
set ttyfast
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

nnoremap [[ ?{<CR>w99[{:nohlsearch<CR>
nnoremap ]] j0[[%/{<CR>:nohlsearch<CR>

colorscheme gruvbox
set background=dark
let g:gruvbox_italic = 1
let g:gruvbox_bold = 0
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_selection = 0

set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
hi HighlightedyankRegion cterm=bold gui=bold ctermbg=0 guibg=#13354A

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
set mouse= "Disabled mouse completely

" -----------------------------------------------------
" Selecting text
" -----------------------------------------------------
set clipboard=unnamed

" -----------------------------------------------------
" Editing text
" -----------------------------------------------------
set showmatch                   " Show matching brackets/parenthesis
set selection=exclusive " $ will not select newline at the end of the line (v$ and d$)

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
set timeoutlen=250

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

" Make Y act like D and C
noremap Y y$

" Start editing after current w
noremap E ea

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

" Poor attempt at moving words to the left or right
nnoremap <Leader><Leader>wl dawea <ESC>pxb
nnoremap <Leader><Leader>wh dawbPa <ESC>bhx

" gf work on node modules
set suffixesadd+=.js
set path+=$PWD/node_modules

" Search and replace in the file
nnoremap <Leader>h :%s/\<<C-r><C-w>\>//c<Left><Left><Left>
vnoremap <Leader>h "hy:%s/<C-r>h//c<left><left><left>

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

" Terminal jk -> ESC mapping
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
let $FZF_DEFAULT_OPTS="--reverse " " top to bottom
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.7} }

" Normal mode completion
fun! s:fzf_root()
	let l:path = finddir('.git', expand('%:p:h').';')
	return fnamemodify(substitute(l:path, '\.git', '', ''), ':p:h')
endfun

nnoremap <silent> <leader>f :exe 'GFiles --exclude-standard --others --cached'<CR>
"nnoremap <silent> <leader>f :exe 'Files ' . <SID>fzf_root()<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>l :BLines<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

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

" FZF find word under cursor in file
nnoremap <Leader>t :Find <C-r><C-w>
vnoremap <Leader>t "hy:Find '<C-r>h'

" Use rg instead of grep when using vimgrep
" RipGrep
let g:rg_derive_root = 1
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
let g:airline#extensions#tabline#formatter = 'jsformatter'

" Javascript library syntax highlighting settings
let g:used_javascript_libs = 'underscore,jquery,angularjs,chai,react'

" Run current buffer through Lebab -> es6-ify a file
function! Lebab()
    let l:winview = winsaveview()
    silent !lebab % -o % --transform arrow,let,arg-spread,obj-method,obj-shorthand,template
    call winrestview(l:winview)
endfunction
command! Lebab :call Lebab()

" ALE config
noremap <Leader><Leader>f :ALEFix<CR>

let g:ale_enabled = 1
let g:ale_fixers = { 'javascript': ['eslint' ] }
let g:ale_linters = { 'javascript': ['eslint'], 'go': ['gopls'] }
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 0

" Quickfix window settings
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

" Enable jsx highlighting for .js files as well
let g:jsx_ext_required = 0

" Go config
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_def_mapping_enabled = 0 " We'll use the language server instead for go to def stuff

" Golang settings
autocmd FileType go nmap <leader><leader>b <Plug>(go-build)
autocmd FileType go nmap <leader><leader>r <Plug>(go-run)
autocmd FileType go nmap <leader><leader>t  <Plug>(go-test)
let g:go_rename_command = 'gopls'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

augroup go
  autocmd!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

nnoremap <silent> <leader>a :cclose<CR>:lclose<CR>

"Fix block cursor
augroup leavingVimStuff
 autocmd VimLeave * set guicursor=a:ver10-blinkon0
augroup END

augroup TerminalStuff
   au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

nmap <Leader><Leader>uh <Plug>(GitGutterUndoHunk)

"Far settings
let g:far#source = 'rgnvim'
let g:far#default_file_mask = '**/*.*'

" COC settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Let nvim know where python is so it doesn't have to find it on startup
let g:loaded_python_provider = 1
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python'

" Save and restore folds automatically
autocmd BufWrite * mkview
autocmd BufRead * silent! loadview

"Snippets
" use tab to forward cycle
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-d>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/dotfiles/']
let g:UltiSnipsExpandTrigger = ';;'
let g:UltiSnipsJumpForwardTrigger = ';;'
let g:UltiSnipsJumpBackwardTrigger = '::'

