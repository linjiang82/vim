return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = function(client)
        -- disable the cababilities so the nvim-navic won't be duplicated
        client.server_capabilities.documentSymbolProvider = false
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.implementationProvider = false
      end,
      -- use other typescript lsp eg 'vtsls' to handle diagnostics
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
    },
  },
}
