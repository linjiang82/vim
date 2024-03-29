local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("tpope/vim-commentary")
	use("mbbill/undotree")
	use("tpope/vim-surround")
	use("nvim-lualine/lualine.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("SmiteshP/nvim-navic")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	-- use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use("lewis6991/gitsigns.nvim")
	use("mfussenegger/nvim-dap")
	use("nvim-telescope/telescope-dap.nvim")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("ryanoasis/vim-devicons")
	use("David-Kunz/jester")
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use("tpope/vim-fugitive")
	use("sindrets/diffview.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lua")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("davidsierradz/cmp-conventionalcommits")
	use("David-Kunz/cmp-npm")
	use("saadparwaiz1/cmp_luasnip")
	use("onsails/lspkind-nvim")
	use("marko-cerovac/material.nvim") -- colorschema
	use("christoomey/vim-tmux-navigator")
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use({
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({})
		end,
	}) -- neovim development
	use("RRethy/vim-illuminate")
	use("lukas-reineke/indent-blankline.nvim")
	use("lunarvim/Onedarker.nvim") --colorschema
	use("kdheepak/lazygit.nvim")
	use("norcalli/nvim-colorizer.lua") --show colors
	-- use("mhartington/formatter.nvim") -- formatter
	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	-- for golang
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua") -- recommanded if need floating window support
	-- markdown preview, run "call mkdp#util#install()" after installed the plugin
	use("iamcco/markdown-preview.nvim")
	use("Tastyep/structlog.nvim")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
