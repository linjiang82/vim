return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = opts.linters_by_ft or {}

    -- Define a function to dynamically resolve linters per project
    local function get_linters()
      local linters = {}
      local ctx = { filename = vim.api.nvim_buf_get_name(0) }

      -- Check for oxlint configuration
      if vim.fs.find({ ".oxlintrc.json", "oxlint.config.ts" }, { path = ctx.filename, upward = true })[1] then
        table.insert(linters, "oxlint")
      end

      -- Check for eslint configuration
      if
        vim.fs.find(
          { ".eslintrc", ".eslintrc.json", "eslint.config.js", "eslint.config.mjs" },
          { path = ctx.filename, upward = true }
        )[1]
      then
        table.insert(linters, "eslint")
      end

      -- If neither is found, you can set a default or leave it empty
      if #linters == 0 then
        table.insert(linters, "eslint") -- common safe fallback
      end

      return linters
    end

    -- Assign the dynamic resolution to JS/TS file types
    opts.linters_by_ft.javascript = get_linters()
    opts.linters_by_ft.typescript = get_linters()
    opts.linters_by_ft.javascriptreact = get_linters()
    opts.linters_by_ft.typescriptreact = get_linters()
  end,
}
