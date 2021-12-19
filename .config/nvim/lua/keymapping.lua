g.mapleader = ","
map("i", "jj", "<ESC>", {})
map("n", "<leader>w", ":w<cr>", {})
map("i", "<leader>w", "<esc>:w<cr>a", {})

local opts = {noremap = true}

--lsp
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
map("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>")
map("n", "<s-k>", ":lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>a", ":Telescope lsp_code_actions<CR>")
-- map("n", "<leader>ca", ":Telescope lsp_range_code_actions<CR>")
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
map("n", "<c-s>", ":lua vim.lsp.buf.signature_help()<CR>")
map("n", "gr", ":lua vim.lsp.buf.references()<CR>")
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
map("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
map("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
map("n", "<left>", ":vertical resize +5<CR>", opts)
map("n", "<right>", ":vertical resize -5<CR>", opts)
map("n", "<up>", ":resize -5<CR>", opts)
map("n", "<down>", ":resize +5<CR>", opts)
