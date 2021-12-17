cmd("set foldmethod=expr")
cmd("set foldexpr=nvim_treesitter#foldexpr()")

require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true
  },
  -- indent = {
  --   enable = true
  -- },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>"
    }
  }
}

-- require('tree-sitter-typescript').typescript -- TypeScript grammar

-- require('tree-sitter-typescript').tsx -- TSX grammar
