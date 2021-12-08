cmd = vim.cmd
g = vim.g --global variable
opt = vim.opt
o = vim.o --global options
wo = vim.wo
bo = vim.bo

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
require('settings/commentary')
require('settings/undoTreeCfg')
require('settings/nvimTree')

