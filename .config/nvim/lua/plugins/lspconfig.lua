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
      -- Enable oxlint as an LSP server
      oxlint = {
        root_dir = function(bufnr, on_dir)
          -- Monorepo support: prioritises the top-level oxlint configuration
          local git = vim.fs.root(bufnr, ".git")
          local markers = { ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts" }
          local root = git and vim.fs.root(git, markers) or vim.fs.root(bufnr, markers)
          if root then
            on_dir(root)
          end
        end,
        settings = {
          fixKind = "safe_fix", -- Options: "safe_fix", "all", or "none"
        },
      },
    },
  },
}
