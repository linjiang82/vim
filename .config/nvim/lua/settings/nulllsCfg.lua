local null_ls = require("null-ls")
-- register any number of sources simultaneously
local sources = {
  -- null_ls.builtins.formatting.prettier,
  -- null_ls.builtins.formatting.prettier_eslint,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.diagnostics.write_good,
  null_ls.builtins.code_actions.gitsigns,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
