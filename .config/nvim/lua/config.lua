-- default options
opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
opt.clipboard = { "unnamed", "unnamedplus" }
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.list = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.termguicolors = true
-- set diffopt+=vertical " starts diff mode in vertical split
opt.cmdheight = 1
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = "yes"
opt.updatetime = 520
opt.undofile = true
cmd("filetype plugin indent on")
opt.backup = false
-- set to only display one statusline
opt.laststatus = 3
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { "javascript", "js=javascript", "json=javascript" }
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
g.guifont = "DroidSansMonos\\ Nerd\\ Font\\ Mono:h11"
-- opt.path:append({ "**" })
cmd([[set path=$PWD/**]])
cmd("colorscheme onedarker")
cmd("hi NormalFloat guibg=#263270")
cmd("packadd cfilter")

-- format on save
cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	command = "FormatWrite",
-- 	-- callback = function()
-- 	--   -- vim.lsp.buf.format();
-- 	-- end
-- })
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
