local null_ls = require("null-ls")
-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.prettierd,
	-- null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.gofmt,
	null_ls.builtins.formatting.stylelint,
	null_ls.builtins.diagnostics.write_good,
	null_ls.builtins.code_actions.gitsigns,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = true,
	sources = sources,
	should_attach = function(bufnr)
		local client_names = vim.lsp.get_active_clients({ bufnr = bufnr })
		for _, client in ipairs(client_names) do
			-- don't use null_ls for vue2
			if client.name == "vuels" then
				return false
			end
		end
		return true
	end,
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
