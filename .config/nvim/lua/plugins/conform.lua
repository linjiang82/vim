return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      swift = { "swift_format", lsp_format = "last" },
      vue = function(bufnr)
        if require("conform").get_formatter_info("prettier", bufnr).available then
          return { "prettier", lsp_format = "never" }
        else
          return { "eslint_d", lsp_format = "first" }
        end
      end,
    },
    -- formatters = {
    --   swift_format = {
    --     prepend_args = { "--configuration", ".swiftformat" },
    --   },
    -- },
  },
}
