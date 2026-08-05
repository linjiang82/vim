return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Define formatters with custom stop conditions
    opts.formatters = {
      oxfmt = {
        condition = function(ctx)
          -- Only run oxfmt if an oxfmt config file exists in the project root
          return vim.fs.find({ ".oxfmtrc.json", ".oxfmtrc.jsonc" }, { path = ctx.filename, upward = true })[1] ~= nil
        end,
      },
      prettier = {
        condition = function(ctx)
          -- Fallback to prettier if prettier config exists
          return vim.fs.find(
            { ".prettierrc", ".prettierrc.json", "prettier.config.js", ".prettierrc.js" },
            { path = ctx.filename, upward = true }
          )[1] ~= nil
        end,
      },
    }

    -- Try oxfmt first; if its condition fails, fallback to prettier
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.javascript = { "oxfmt", "prettier", stop_after_first = true }
    opts.formatters_by_ft.typescript = { "oxfmt", "prettier", stop_after_first = true }
    opts.formatters_by_ft.javascriptreact = { "oxfmt", "prettier", stop_after_first = true }
    opts.formatters_by_ft.typescriptreact = { "oxfmt", "prettier", stop_after_first = true }
  end,
}
-- local formatterSelector = function(bufnr)
--   if require("conform").get_formatter_info("prettier", bufnr).available then
--     return { "prettier", lsp_format = "never" }
--   else
--     return { "eslint_d", lsp_format = "first" }
--   end
-- end
--
-- return {
--   "stevearc/conform.nvim",
--   opts = {
--     formatters_by_ft = {
--       swift = { "swift_format", lsp_format = "first" },
--       vue = formatterSelector,
--       typescript = formatterSelector,
--     },
-- formatters = {
--   swift_format = {
--     prepend_args = { "--configuration", ".swiftformat" },
--   },
-- },
--   },
-- }
