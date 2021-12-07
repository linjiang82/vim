cmd = vim.cmd
g = vim.g
opt = vim.opt

function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('plugins')
require('keymapping')
require('config')
require('settings/lualine')
require('settings/term')

