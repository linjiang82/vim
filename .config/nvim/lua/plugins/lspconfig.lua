local lspconfig = require("lspconfig")

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      graphql = {
        root_dir = lspconfig.util.root_pattern("graphql.config.*", ".graphqlrc", "package.json"),
      },
      sourcekit = {
        cmd = { "xcrun", "sourcekit-lsp" },
        filetypes = { "swift", "objective-c", "objective-cpp" },
        root_dir = lspconfig.util.root_pattern("Package.swift", ".git"),
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      },
      kotlin_language_server = {
        cmd = { "kotlin-language-server" },
        filetypes = { "kotlin" },
        root_dir = lspconfig.util.root_pattern("settings.gradle.kts", ".git"),
      },
    },
  },
}
