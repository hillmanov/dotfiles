require('lazy').setup({ 
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-abolish",
  "tpope/vim-speeddating",
  "tpope/vim-projectionist",

  "nvim-lua/plenary.nvim",
  "AndrewRadev/splitjoin.vim",
  "nvim-tree/nvim-tree.lua", 
  "hoob3rt/lualine.nvim",
  "nvim-tree/nvim-web-devicons",
  {"norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000,
    init = function() 
      vim.o.background = "dark" 
      vim.cmd("colorscheme gruvbox")
    end
  },
  {'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function() 
      require('bufferline').setup{
        options = {
          separator_style = "slant",
        }
      } 
    end,
  },
  "junegunn/vim-easy-align",
  "kshenoy/vim-signature",
  "airblade/vim-gitgutter",
  "jremmen/vim-ripgrep",
  "easymotion/vim-easymotion",
  "wellle/targets.vim",
  "andymass/vim-matchup",
  "ryanoasis/vim-devicons",
  "brooth/far.vim",
  "qpkorr/vim-renamer",
  "dense-analysis/ale",

  -- Completion
  {"hrsh7th/nvim-cmp",
    disable = false,
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-cmdline",
  "quangnguyen30192/cmp-nvim-ultisnips",

  {"SirVer/ultisnips",
    init = function()
      -- Had to move this here for lazy.nvim, otherwise the tab button would insert whatever was in UltiSnipsExpandTrigger. Timing/loading difference. 
      vim.g.UltiSnipsSnippetDirectories = { os.getenv "HOME" .. "/.config/nvim/UltiSnips" }
      vim.g.UltiSnipsExpandTrigger = ';;'
      vim.g.UltiSnipsJumpForwardTrigger = ';;'
      vim.g.UltiSnipsJumpBackwardTrigger = '::'
    end,
  },
  "mbbill/undotree",
  {"folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup{}
    end,
  },
  "fatih/vim-go",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-telescope/telescope.nvim",
  "github/copilot.vim",
  "muniftanjim/nui.nvim",
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 1 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    },
    dependencies = {
      "muniftanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  "isobit/vim-caddyfile",
})

require('lspconfig').tsserver.setup{}

-- Relative requires not possible, so we have to start at the top
require("plugins/config/copilot");
require("plugins/config/nvim-tree");
require("plugins/config/telescope");
require("plugins/config/lualine");
require("plugins/config/treesitter");
require("plugins/config/ultisnips");
require("plugins/config/go");
require("plugins/config/cmp");
require("plugins/config/mason");
