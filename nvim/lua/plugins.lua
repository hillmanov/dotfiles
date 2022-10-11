require "paq" {
  "tpope/vim-fugitive";
  "tpope/vim-surround";
  "tpope/vim-commentary";
  "tpope/vim-repeat";
  "tpope/vim-abolish";
  "tpope/vim-speeddating";
  "tpope/vim-projectionist"; 
  "AndrewRadev/splitjoin.vim";
  "preservim/nerdtree";
  "hoob3rt/lualine.nvim";
  "kyazdani42/nvim-web-devicons";
  "akinsho/bufferline.nvim";
  "junegunn/vim-easy-align";
  "kshenoy/vim-signature";
  "airblade/vim-gitgutter";
  "ellisonleao/gruvbox.nvim";
  "jremmen/vim-ripgrep";
  "easymotion/vim-easymotion";
  "wellle/targets.vim";
  "andymass/vim-matchup";
  "ryanoasis/vim-devicons";
  "brooth/far.vim";
  "qpkorr/vim-renamer";
  "dense-analysis/ale";
  "SirVer/ultisnips";
  "mbbill/undotree";
  "folke/todo-comments.nvim";
  {"fatih/vim-go", run=":GoInstallBinaries" };
  "nvim-lua/plenary.nvim";
  "neovim/nvim-lspconfig";
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"};
  "nvim-treesitter/nvim-treesitter-textobjects";
  "nvim-telescope/telescope.nvim";
  "github/copilot.vim";
}

require("plugin-configs/nerdtree");
require("plugin-configs/telescope");
require("plugin-configs/lualine");
require("plugin-configs/treesitter");
require("plugin-configs/todo-comments");
require("plugin-configs/bufferline");
require("plugin-configs/ultisnips");

