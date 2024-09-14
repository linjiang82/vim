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
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      require("conform").setup({
        formatters_by_ft = {
          swift = { "swift_format", lsp_format = "last" },
          vue = { lsp_format = "first" },
        },
        -- formatters = {
        --   swift_format = {
        --     prepend_args = { "--configuration", ".swiftformat" },
        --   },
        -- },
      }),
    },
  },
}
