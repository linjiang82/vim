local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- vue_ls = {},
      vtsls = {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        settings = {
          typescript = {
            tsserver = {
              maxTsServerMemory = 16384,
            },
          },
          vtsls = {
            autoUseWorkspaceTsdk = true,
            -- tsserver = {
            --   globalPlugins = {
            --     {
            --       name = "@vue/typescript-plugin",
            --       location = "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
            --       languages = { "vue" },
            --       configNamespace = "typescript",
            --       enableForWorkspaceTypeScriptVersions = true,
            --     },
            --   },
            -- },
          },
        },
      },
      graphql = {
        cmd = {
          "graphql-lsp",
          "server",
          "-m",
          "stream",
        },
        filetypes = { "graphql", "gql" },
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          on_dir(util.root_pattern(".graphqlrc*", ".graphql.config.*", "graphql.config.*")(fname))
        end,
      },
      sourcekit = {
        cmd = { "xcrun", "sourcekit-lsp" },
        filetypes = { "swift", "objective-c", "objective-cpp" },
        root_dir = util.root_pattern("Package.swift", ".git"),
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
        root_dir = util.root_pattern("settings.gradle.kts", ".git"),
      },
    },
  },
}
