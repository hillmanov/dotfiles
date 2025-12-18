require("lazy").setup({ 
  { "tpope/vim-fugitive", cmd = { "Git", "G", "Gstatus", "Gread", "Gblame", "Gpush", "Gpull", "Gdiff" } },
  "tpope/vim-surround",
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-abolish",
  "tpope/vim-speeddating",
  "tpope/vim-projectionist",
  { 
    'echasnovski/mini.nvim', 
    config = function()
      require("mini.ai").setup({
        n_lines = 5000,
        -- How to search for object (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
        search_method = 'cover_or_next',
      })
      require("mini.splitjoin").setup()
      -- require("mini.surround").setup()
      require("mini.move").setup()
      require("mini.pairs").setup()
      require("mini.align").setup()
    end
  },
  "nvim-lua/plenary.nvim",
  { "voldikss/vim-floaterm", cmd = { "FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev" } },
  "nvim-tree/nvim-tree.lua", 
  "hoob3rt/lualine.nvim",
  "nvim-tree/nvim-web-devicons",
  {"norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      require("colorizer").setup()
    end,
  },
  {"ellisonleao/gruvbox.nvim", priority = 1000,
    init = function() 
      vim.o.background = "dark" 
      vim.cmd("colorscheme gruvbox")
    end
  },
  {"akinsho/bufferline.nvim", 
    version = "*", 
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function() 
      require("bufferline").setup{
        options = {
          separator_style = "slant",
        }
      } 
    end,
  },
  "kshenoy/vim-signature", -- Show marks in the gutter
  "airblade/vim-gitgutter", 
  "jremmen/vim-ripgrep",
  "easymotion/vim-easymotion",
  "wellle/targets.vim",
  "andymass/vim-matchup",
  "ryanoasis/vim-devicons",
  { "brooth/far.vim", cmd = { "Far", "Fardo", "Farundo", "Farp", "Farr" } },
  { "qpkorr/vim-renamer", cmd = "Renamer" },
  -- "dense-analysis/ale",
  -- Completion
  {"hrsh7th/nvim-cmp",
    disable = false,
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      'neovim/nvim-lspconfig',
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = {
      hint_enable = false, -- disable virtual text hints
      handler_opts = {
        border = "rounded",
      },
    },
  },
  "hrsh7th/cmp-cmdline",
  "quangnguyen30192/cmp-nvim-ultisnips",
  {"SirVer/ultisnips",
    init = function()
      -- Had to move this here for lazy.nvim, otherwise the tab button would insert whatever was in UltiSnipsExpandTrigger. Timing/loading difference. 
      vim.g.UltiSnipsSnippetDirectories = { os.getenv "HOME" .. "/.config/nvim/UltiSnips" }
      vim.g.UltiSnipsExpandTrigger = ";;"
      vim.g.UltiSnipsJumpForwardTrigger = ";;"
      vim.g.UltiSnipsJumpBackwardTrigger = "::"
    end,
  },
  { "mbbill/undotree", cmd = "UndotreeToggle" },
  {"folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufReadPost",
    config = function()
      require("todo-comments").setup{}
    end,
  },
  {"nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false
        },
        rename = {
          in_select = false,
        }
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    }
  },
  { "fatih/vim-go", ft = { "go", "gomod", "gowork", "gotmpl" } },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",

  "github/copilot.vim",
  "muniftanjim/nui.nvim",
  { "isobit/vim-caddyfile", ft = "caddyfile" },
  {
    "David-Kunz/gen.nvim",
    cmd = "Gen",
    opts = {
      model = "llama3.1",
      host = "titan",
      port = "11434",
      display_mode = "float",
      init = function(options) end,
      command = function(options)
            local body = {model = options.model, stream = true}
            return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
        end,
    }
  },
  -- It started throwing an error. :(
  -- {
  --   "laytan/tailwind-sorter.nvim",
  --   dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim"},
  --   build = "cd formatter && npm i && npm run build",
  --   config = true,
  --   opts = {
  --     on_save_enabled = true,
  --     on_save_pattern = { '*.html', '*.jsx', '*.tsx'}, -- The file patterns to watch and sort.
  --     trim_spaces = false, -- Removes spaces in `` marks as well, which is bad. 
  --   }
  -- },
  "christoomey/vim-tmux-navigator",
})

-- TS/JS LSP

-- require("lspinstall").setup()
-- local servers = require("lspinstall").installed_servers()
-- for _, server in pairs(servers) do
--   require("lspconfig")[server].setup{}
-- end

-- Relative requires not possible, so we have to start at the top
require("plugins/config/nvim-tree");
require("plugins/config/telescope");
require("plugins/config/lualine");
require("plugins/config/treesitter");
require("plugins/config/ultisnips");
require("plugins/config/go");
require("plugins/config/cmp");
require("plugins/config/lsp");
require("plugins/config/mason");
