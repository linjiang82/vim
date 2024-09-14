-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
---
--- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/typescript-tools.nvim")
-- vim.lsp.set_log_level("debug")
vim.api.nvim_create_user_command("Pyrun", ":term python3 '%' <CR>", { desc = "Run current python buffer" })
