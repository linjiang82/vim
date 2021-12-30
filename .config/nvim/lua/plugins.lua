local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"
    use "tpope/vim-commentary"
    use "mbbill/undotree"
    use "tpope/vim-surround"
    use "nvim-lualine/lualine.nvim"
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"
    use "p00f/nvim-ts-rainbow"
    use "mhartington/formatter.nvim"
    use {
      "neovim/nvim-lspconfig",
      "williamboman/nvim-lsp-installer"
    }
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-telescope/telescope.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "lewis6991/gitsigns.nvim"
    use "mfussenegger/nvim-dap"
    use "nvim-telescope/telescope-dap.nvim"
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"
    use "ryanoasis/vim-devicons"
    use "David-Kunz/jester"
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "tpope/vim-fugitive"
    use "sindrets/diffview.nvim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/nvim-cmp"
    use "onsails/lspkind-nvim"
    use "David-Kunz/cmp-npm"
    use "marko-cerovac/material.nvim"
    use "christoomey/vim-tmux-navigator"
    use "L3MON4D3/LuaSnip" -- Snippets plugin
    use "saadparwaiz1/cmp_luasnip"
    use "norcalli/nvim-colorizer.lua" --show colors
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
  end
)
