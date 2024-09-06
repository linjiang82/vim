return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        file_ignore_patterns = { "node_modules", ".git" },
        hidden = true,
      },
    },
  },
}
