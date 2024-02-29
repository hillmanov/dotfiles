require('lualine').setup({
  options = {
    theme = 'gruvbox'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'searchcount'},
    lualine_c = {''},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
})
