require('packer').startup(function(use) 
  use "wbthomason/packer.nvim"
  
  use "tpope/vim-fugitive"
  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "tpope/vim-repeat"
  use "tpope/vim-abolish"
  use "tpope/vim-speeddating"
  use "tpope/vim-projectionist";

  use "nvim-lua/plenary.nvim"
  use "AndrewRadev/splitjoin.vim"
  use "nvim-tree/nvim-tree.lua" 
  use "hoob3rt/lualine.nvim"
  use "nvim-tree/nvim-web-devicons"
  use {"norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end,
  }
  use {"ellisonleao/gruvbox.nvim", 
    config = function()
      require('gruvbox').setup{}
    end,
  }
  use {'akinsho/bufferline.nvim', 
    tag = "v3.*", 
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() 
      require('bufferline').setup{
        options = {
            separator_style = "slant"
        }
      } 
    end,
  }
  use "junegunn/vim-easy-align"
  use "kshenoy/vim-signature"
  use "airblade/vim-gitgutter"
  use "jremmen/vim-ripgrep"
  use "easymotion/vim-easymotion"
  use "wellle/targets.vim"
  use "andymass/vim-matchup"
  use "ryanoasis/vim-devicons"
  use "brooth/far.vim"
  use "qpkorr/vim-renamer"
  use "dense-analysis/ale"
  
  -- Completion
  use {"hrsh7th/nvim-cmp",
    disable = false,
  }
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-cmdline"
  use "quangnguyen30192/cmp-nvim-ultisnips"

  use "SirVer/ultisnips"
  use "mbbill/undotree"
  use {"folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use "fatih/vim-go"
  use "neovim/nvim-lspconfig"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "nvim-telescope/telescope.nvim"
  use "github/copilot.vim"
  use 'muniftanjim/nui.nvim'
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
end
)

require('lspconfig').tsserver.setup{}

-- Relative requires not possible, so we have to start at the top
require("plugins/config/copilot");
require("plugins/config/nvim-tree");
require("plugins/config/telescope");
require("plugins/config/lualine");
require("plugins/config/treesitter");
require("plugins/config/todo-comments");
require("plugins/config/ultisnips");
require("plugins/config/go");
require("plugins/config/cmp");


