-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

require('nvim-tree').setup({
  hijack_cursor = true,
  update_focused_file = { enable = true },
  view = {
    width = 60
  }
})
map('n', '<leader>x', ':NvimTreeToggle<CR>', {silent=true})
