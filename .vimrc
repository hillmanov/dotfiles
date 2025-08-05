""----------------------------------------------------- 
""Plugins
""----------------------------------------------------- 
"call plug#begin('~/.vim/plugged')

"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-speeddating'
"Plug 'tpope/vim-projectionist' " Jump to alternate files quickly. 
"Plug 'AndrewRadev/splitjoin.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'hoob3rt/lualine.nvim'
"Plug 'akinsho/bufferline.nvim'
"Plug 'junegunn/vim-easy-align'
"Plug 'kshenoy/vim-signature' " Adds label in gutter for marks
"Plug 'airblade/vim-gitgutter'
"Plug 'morhetz/gruvbox'
"Plug 'jremmen/vim-ripgrep'
"Plug 'easymotion/vim-easymotion'
"Plug 'wellle/targets.vim'
"Plug 'andymass/vim-matchup'
"Plug 'ryanoasis/vim-devicons'
"Plug 'kyazdani42/nvim-web-devicons'
"Plug 'brooth/far.vim'
"Plug 'qpkorr/vim-renamer'
"Plug 'dense-analysis/ale'
"Plug 'SirVer/ultisnips'
"Plug 'mbbill/undotree'
"Plug 'folke/todo-comments.nvim'
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'nvim-lua/plenary.nvim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

"Plug 'github/copilot.vim'
"call plug#end()            

"" -----------------------------------------------------
"" Moving around, searching and patterns
"" ------------------------------------------------------
"set ignorecase                  " Case insensitive search
"set smartcase                   " Case sensitive when uc present
"set iskeyword-=.                " '.' is an end of word designator
"set iskeyword-=#                " '#' is an end of word designator
"set iskeyword-=-                " '-' is an end of word designator
"set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
"set inccommand=nosplit          " Live search and replace

"" -----------------------------------------------------
"" Displaying text
"" -----------------------------------------------------
"set guifont=FiraCode\ Nerd\ Font:h12
"set encoding=utf8
"set number                          " Line numbers on
"set relativenumber              " Relative line numbers
"set scrolloff=8                 " Minimum lines to keep above and below cursor
"set nowrap                      " Don't wrap long lines Don't
"set nocursorcolumn
"set cursorline
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Pipe in insert mode, block in others
"set completeopt-=preview
"" Automatically change the current directory
"" Had to do it on insert enter. autochdir didn't work properly with path
"" completion for some reason
"" autocmd InsertEnter * silent! lcd %:p:h
"set lazyredraw                 " don't update the display while executing macros
"set gdefault " Replace all instances on a line by default
"set ttyfast
""
"" -----------------------------------------------------
"" Syntax, highlighting and spelling
"" -----------------------------------------------------
"syntax on
"syntax sync minlines=256
"autocmd BufEnter * :syn sync maxlines=500
"if (has("termguicolors"))
" set termguicolors
"endif

"nnoremap [[ ?{<CR>w99[{:nohlsearch<CR>
"nnoremap ]] j0[[%/{<CR>:nohlsearch<CR>

"colorscheme gruvbox
"set background=dark
"let g:gruvbox_italic = 1
"let g:gruvbox_bold = 0
"let g:gruvbox_underline = 1
"let g:gruvbox_undercurl = 1
"let g:gruvbox_contrast_dark = 'medium'
"let g:gruvbox_invert_selection = 0

"autocmd ColorScheme * highlight CocErrorFloat guifg=#ffffff
"autocmd ColorScheme * highlight CocInfoFloat guifg=#ffffff
"autocmd ColorScheme * highlight CocWarningFloat guifg=#ffffff

"set hlsearch
"hi Search ctermbg=LightYellow
"hi Search ctermfg=Red
"hi HighlightedyankRegion cterm=bold gui=bold ctermbg=0 guibg=#13354A

"set autowrite "Checking to see if this will help remove some "nanny" messages
"au BufNewFile,BufRead *.ejs set filetype=html " Treat ejs files like html for syntax highlighting

"" Highlight yank
"au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=350, on_visual=true}

"" -----------------------------------------------------
"" Multiple windows
"" -----------------------------------------------------
"set hidden                      " Allow buffer switching without saving
"set splitright                  " A new window is put right of the current one
"set splitbelow                  " A new window is put below of the current one

"" -----------------------------------------------------
"" Using the mouse
"" -----------------------------------------------------
"set mouse= "Disabled mouse completely

"" -----------------------------------------------------
"" Selecting text
"" -----------------------------------------------------
"set clipboard=unnamedplus

"" -----------------------------------------------------
"" Editing text
"" -----------------------------------------------------
"set showmatch                   " Show matching brackets/parenthesis
"set selection=exclusive " $ will not select newline at the end of the line (v$ and d$)

"set conceallevel=1

"" -----------------------------------------------------
"" Tabs and indenting
"" -----------------------------------------------------
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set expandtab " use spaces instead of tabs.
"set shiftround " tab / shifting moves to closest tabstop.
"set smartindent " Intellegently dedent / indent new lines based on rules."

"" -----------------------------------------------------
"" Folding
"" -----------------------------------------------------
"set foldmethod=manual
"set foldnestmax=1
"set nofoldenable

"" -----------------------------------------------------
"" Mapping
"" -----------------------------------------------------
"set timeoutlen=250

"" -----------------------------------------------------
"" The swap file
"" -----------------------------------------------------
"set noswapfile " Turn off swp file creation

"" -----------------------------------------------------
"" Command line editing
"" -----------------------------------------------------
"set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

"" -----------------------------------------------------
"" Various
"" -----------------------------------------------------
"scriptencoding utf-8
"set undofile                                            " save central undo files
"set undodir=~/.vim/tmp/undo/
"set backup                                              " enable backups
"set backupdir=~/.vim/tmp/backup/
"set virtualedit=onemore                                 " Allow for cursor beyond last character
"set nojoinspaces                                        " Don't add more spaces with joing lines with <S-J>
"set shortmess=ITF                                       " Don't show the intro message on startup
""
"" -----------------------------------------------------
"" Key (re)mappings
"" -----------------------------------------------------
"let g:mapleader = ' '
"imap jk <Esc>
"vmap jk <Esc>

"noremap j gj
"noremap k gk

"" Make Y act like D and C
"noremap Y y$

"" Start editing after current w
"noremap E ea

"" Go to the end of what was just pasted.
"vnoremap <silent> y y`]
"vnoremap <silent> p p`]
"nnoremap <silent> p p`]
"nnoremap <silent> <c-l> :<C-u>nohlsearch<cr><c-l>

"vnoremap < <gv
"vnoremap > >gv
"vnoremap = =gv

"noremap <tab> :bn<CR>
"noremap <S-tab> :bp<CR>
"noremap <Leader>x :bd<CR>
"noremap <Leader>c <C-w>q
"noremap <Leader>p $p

"" Replace current word with what is in the clipboard
"nnoremap <Leader>r "_diwP

"" Repeat last replacement of a word
"nnoremap <leader>. :let @/=@"<cr>/<cr>cgn<c-r>.<esc>

"" Move lines around with Ctrl j and k in any mode
"nnoremap <C-j> :m .+1<CR>
"nnoremap <C-k> :m .-2<CR>
"vnoremap <C-j> :m '>+1<CR>gv
"vnoremap <C-k> :m '<-2<CR>gv
"inoremap <C-j> <Esc>:m+<CR>gi
"inoremap <C-k> <Esc>:m-2<CR>gi

"" Format json
"nnoremap <Leader><Leader>j :%!python -m json.tool<CR>
"vnoremap <Leader><Leader>j :'<,'>!python -m json.tool<CR>

"" Select pasted text
"nnoremap gp `[v`]

"nnoremap <Leader>w :w<cr>
"nnoremap <Leader><Leader>n :!node %<cr>

""AOC
"nnoremap <Leader>arc :make run-current<cr>

"" Poor attempt at moving words to the left or right
"nnoremap <Leader><Leader>wl dawea <ESC>pxb
"nnoremap <Leader><Leader>wh dawbPa <ESC>bhx

"" gf work on node modules
"set suffixesadd+=.js
"set path+=$PWD/node_modules

"" Search and replace in the file
"nnoremap <Leader>h :%s/\<<C-r><C-w>\>//c<Left><Left>
"vnoremap <Leader>h "hy:%s/<C-r>h//c<left><left>

"" vimrc edit and source
"nnoremap <Leader>ev :e $MYVIMRC<cr>
"nnoremap <Leader>sv :source $MYVIMRC<cr>

"let g:indent_guides_enable_on_vim_startup = 0

"" Permanent magic regex mode
"nnoremap / /\v
"vnoremap / /\v
"cnoremap %s/ %smagic/
"cnoremap \>s/ \>smagic/
"nnoremap :g/ :g/\v
"nnoremap :g// :g//

"" Quick fix file navigation
"nmap <silent> <DOWN> :cprevious<CR> " j/k style navigation on my keyboard
"nmap <silent> <LEFT> :cnext<CR>

"" Terminal jk -> ESC mapping
"tnoremap jk <c-\><c-n>


"" -----------------------------------------------------
"" PLugin settings
"" -----------------------------------------------------
"" NERFTree customizations
"fun! s:project_root()
"	let l:path = finddir('.git', expand('%:p:h').';')
"	return fnamemodify(substitute(l:path, '\.git', '', ''), ':p:h')
"endfun

"map <C-n> :exe 'NERDTreeToggle ' . <SID>project_root()<CR>
"nmap <Leader>nt :NERDTreeFind<CR>

"let g:NERDTreeShowBookmarks=1
"let g:NERDTreeIgnore=['\~$', '\.swp$', '^\.git$','^node_modules$', '^\.DS_Store$']
"let g:NERDTreeChDirMode=0
"let g:NERDTreeQuitOnOpen=1
"let g:NERDTreeMouseMode=2
"let g:NERDTreeShowHidden=1
"let g:NERDTreeKeepTreeInNewTab=1
"let g:nerdtree_tabs_open_on_gui_startup=0

"" Use rg instead of grep when using vimgrep
"" RipGrep
"let g:rg_derive_root = 1
"set grepprg=rg\ --vimgrep

"function! s:buflist()
"  redir => l:ls
"  silent ls
"  redir END
"  return split(l:ls, '\n')
"endfunction

"function! s:bufopen(e)
"  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
"endfunction

"" Start ieteractive EasyAlign in visual mode (e.g. vip<Enter>)
"vmap <Enter> <Plug>(EasyAlign)

"" Run current buffer through Lebab -> es6-ify a file
"function! Lebab()
"    let l:winview = winsaveview()
"    silent !lebab % -o % --transform arrow,let,arg-spread,obj-method,obj-shorthand,template
"    call winrestview(l:winview)
"endfunction
"command! Lebab :call Lebab()

"" ALE config
"noremap <Leader><Leader>f :ALEFix<CR>

"let g:ale_enabled = 1
"let g:ale_fixers = { 'javascript': ['eslint' ] }
"let g:ale_linters = { 'javascript': ['eslint'], 'go': ['gopls'] }
"let g:ale_sign_column_always = 1
"let g:ale_fix_on_save = 0

"" Quickfix window settings
"augroup qf
"    autocmd!
"    autocmd FileType qf set nobuflisted
"augroup END

"" Enable jsx highlighting for .js files as well
"let g:jsx_ext_required = 0

""""""
"" Go config
""
"" disable all linters as that is taken care of by coc.nvim
"let g:go_diagnostics_enabled = 0
"let g:go_metalinter_enabled = []

"" don't jump to errors after metalinter is invoked
"let g:go_jump_to_error = 0
""
"let g:go_list_type = "quickfix"
"let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1

"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_space_tab_error = 0
"let g:go_highlight_array_whitespace_error = 0
"let g:go_highlight_trailing_whitespace_error = 0
"let g:go_highlight_extra_types = 1
"let g:go_def_mapping_enabled = 0 " We'll use the language server instead for go to def stuff
""
"" automatically highlight variable your cursor is on
"let g:go_auto_sameids = 0

"" Golang settings
"autocmd FileType go nmap <leader><leader>b <Plug>(go-build)
"autocmd FileType go nmap <leader><leader>r <Plug>(go-run)
"autocmd FileType go nmap <leader><leader>t  <Plug>(go-test)
"let g:go_rename_command = 'gopls'
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'

"augroup go
"  autocmd!
"  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"augroup END

"nnoremap <silent> <leader>a :cclose<CR>:lclose<CR>

""Fix block cursor
"augroup leavingVimStuff
" autocmd VimLeave * set guicursor=a:ver10-blinkon0
"augroup END

"augroup TerminalStuff
"   au!
"  autocmd TermOpen * setlocal nonumber norelativenumber
"augroup END

"nmap <Leader><Leader>uh <Plug>(GitGutterUndoHunk)

""Far settings
"let g:far#source = 'rgnvim'
"let g:far#default_file_mask = '**/*.*'

"" COC settings
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <leader>rn <Plug>(coc-rename)

"" Let nvim know where python is so it doesn't have to find it on startup
"let g:loaded_python_provider = 1
"let g:python_host_skip_check=1
"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_skip_check=1
"let g:python3_host_prog = '/usr/bin/python'

"" Save and restore folds automatically
"autocmd BufWrite * mkview
"autocmd BufRead * silent! loadview

"" use tab to forward cycle
"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

""Snippets
"" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/dotfiles/']
"let g:UltiSnipsExpandTrigger = ';;'
"let g:UltiSnipsJumpForwardTrigger = ';;'
"let g:UltiSnipsJumpBackwardTrigger = '::'

"autocmd FileType javascript,javascriptreact,typescript,typescriptreact UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact

"" ------------------------------
""  Telescope
"" ------------------------------
"nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>n <cmd>lua require('telescope.builtin').file_browser()<cr>

"" Lua configs!
"lua << EOF
"require'lspconfig'.gopls.setup{}
"require'nvim-treesitter.configs'.setup {
"  ensure_installed = "all",     
"  ignore_install = { "haskell" },
"  highlight = {
"    enable = true              
"  },
"  indent = {
"    enable = true
"  },
"  textobjects = {
"    select = {
"      enable = true,
"      lookahead = true,
"      keymaps = {
"        ["af"] = "@function.outer",
"        ["if"] = "@function.inner",
"        ["aa"] = "@parameter.inner",
"      },
"    },
"    swap = {
"      enable = true,
"      swap_next = {
"        ["<leader><leader>l"] = "@parameter.inner",
"      },
"      swap_previous = {
"        ["<leader><leader>h"] = "@parameter.inner",
"      },
"    },
"    move = {
"      enable = true,
"      set_jumps = true, -- whether to set jumps in the jumplist
"      goto_next_start = {
"        ["]]"] = "@function.outer",
"      },
"      goto_previous_start = {
"        ["[["] = "@function.outer",
"      },
"    },
"  },
"--  incremental_selection = {
" --   enable = true,
"  --  keymaps = {
"   --   init_selection = "<S-n>",
"    --  node_incremental = "<S-n>",
"     -- node_decremental = "<S-m>",
"   -- },
"  -- },
"}
"require("todo-comments").setup{}

"require('lualine').setup({
"  options = {
"    theme = 'gruvbox'
"  },
"})

"require("bufferline").setup{
"  options = {
"    max_name_length = 50,
"    separator_style = "slant"
"  }
"}

"local actions = require('telescope.actions')

"require('telescope').setup{
"  defaults = {
"    prompt_prefix = " ",
"    selection_caret = " ",
"    entry_prefix = "  ",
"    initial_mode = "insert",
"    selection_strategy = "reset",
"    sorting_strategy = "ascending",
"    layout_strategy = "horizontal",
"    layout_config = {
"      width = 0.75,
"      prompt_position = "top",
"      preview_cutoff = 120,
"      horizontal = { mirror = false },
"      vertical = { mirror = false },
"    },
"    file_sorter = require("telescope.sorters").get_fzy_sorter,
"    file_ignore_patterns = {".git"},
"    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
"    path_display = { "truncate" },
"    winblend = 0,
"    border = {},
"    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
"    color_devicons = true,
"    use_less = true,
"    set_env = { ["COLORTERM"] = "truecolor" },
"    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
"    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
"    qbbist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
"    mappings = {
"      i = {
"        ["<esc>"] = actions.close,
"        ["<C-j>"] = actions.move_selection_next,
"        ["<C-k>"] = actions.move_selection_previous,
"        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
"        ["<CR>"] = actions.select_default + actions.center,
"      },
"      n = {
"        ["<C-j>"] = actions.move_selection_next,
"        ["<C-k>"] = actions.move_selection_previous,
"        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
"      },
"    },
"  },
"  extensions = {
"    fzy_native = {
"      override_generic_sorter = false,
"      override_file_sorter = true,
"    },
"  }
"}
"EOF

""-------------------------------
"" Copilot
"" -------------------------------
"imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
