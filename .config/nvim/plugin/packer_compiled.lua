-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/John/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/John/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/John/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/John/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/John/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-npm"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  jester = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/jester",
    url = "https://github.com/David-Kunz/jester"
  },
  ["lightline-bufferline"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/lightline-bufferline",
    url = "https://github.com/mengelbrecht/lightline-bufferline"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/rainbow",
    url = "https://github.com/luochen1990/rainbow"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["treesitter-unit"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/treesitter-unit",
    url = "https://github.com/David-Kunz/treesitter-unit"
  },
  undotree = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://github.com/alvan/vim-closetag"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/John/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end