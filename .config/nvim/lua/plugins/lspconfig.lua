return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local lspconfig = require("lspconfig")
      lspconfig.sourcekit.setup({
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })
      lspconfig.eslint.setup({
        useFlatConfig = true,
        experimental = {
          useFlatConfig = true,
        },
      })
    end,
  },
}
