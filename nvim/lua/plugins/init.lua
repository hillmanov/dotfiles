require("lazy").setup({ 
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
  "junegunn/vim-easy-align",
  "kshenoy/vim-signature", -- Show marks in the gutter
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
      vim.g.UltiSnipsExpandTrigger = ";;"
      vim.g.UltiSnipsJumpForwardTrigger = ";;"
      vim.g.UltiSnipsJumpBackwardTrigger = "::"
    end,
  },
  "mbbill/undotree",
  {"folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup{}
    end,
  },
  {"nvimdev/lspsaga.nvim",
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
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons",     -- optional
    }
  },
  "fatih/vim-go",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",

  "github/copilot.vim",
  "muniftanjim/nui.nvim",
  "isobit/vim-caddyfile",
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "llama3.1", -- The default model to use.
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
  {
    "laytan/tailwind-sorter.nvim",
    dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim"},
    build = "cd formatter && npm i && npm run build",
    config = true,
    opts = {
      on_save_enabled = true,
      trim_spaces = false, -- Removes spaces in `` marks as well, which is bad. 
    }
  },
  "fedepujol/move.nvim",
  "christoomey/vim-tmux-navigator",
})

require("lspconfig").ts_ls.setup{
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}
require("lspconfig").tailwindcss.setup{}

-- require("lspinstall").setup()
-- local servers = require("lspinstall").installed_servers()
-- for _, server in pairs(servers) do
--   require("lspconfig")[server].setup{}
-- end

-- Relative requires not possible, so we have to start at the top
require("plugins/config/copilot");
require("plugins/config/nvim-tree");
require("plugins/config/telescope");
require("plugins/config/lualine");
require("plugins/config/treesitter");
require("plugins/config/move");
require("plugins/config/ultisnips");
require("plugins/config/go");
require("plugins/config/cmp");
require("plugins/config/mason");
require("plugins/config/ale");
