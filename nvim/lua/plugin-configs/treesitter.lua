require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "javascript", "json", "lua", "make", "typescript", "vim" },
  highlight = {
    enable = true              
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aa"] = "@parameter.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader><leader>l"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader><leader>h"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
      },
    },
  },
--  incremental_selection = {
 --   enable = true,
  --  keymaps = {
   --   init_selection = "<S-n>",
    --  node_incremental = "<S-n>",
     -- node_decremental = "<S-m>",
   -- },
  -- },
}


