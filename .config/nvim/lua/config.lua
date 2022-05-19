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
-- set diffopt+=vertical " starts diff mode in vertical split
opt.cmdheight = 1
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = "yes"
opt.updatetime = 520
opt.undofile = true
cmd("filetype plugin indent on")
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { "javascript", "js=javascript", "json=javascript" }

g.guifont = "DroidSansMonos\\ Nerd\\ Font\\ Mono:h11"
-- opt.path:append({ "**" })
vim.cmd([[set path=$PWD/**]])
vim.cmd("colorscheme material")
vim.cmd("hi NormalFloat guibg=#263270")
