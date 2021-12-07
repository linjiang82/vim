-- hoob3rt/lualine.nvim
require('lualine').setup({
  options = {
    -- theme = "vscode",
    -- theme = "nord",
    theme = "material-nvim",
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {{'filename', path = 2}},
    lualine_b = {'branch', {
      'diff',
      -- color_added = 'green',
      -- color_modified = 'yellow',
      -- color_removed = 'red'
    }},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
})
