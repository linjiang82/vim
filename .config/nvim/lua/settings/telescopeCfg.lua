-- nvim-telescope/telescope.nvim
_G.telescope_find_files_in_path = function(path)
  local _path = path or vim.fn.input("Dir: ", "", "dir")
  require("telescope.builtin").find_files({search_dirs = {_path}})
end
_G.telescope_live_grep_in_path = function(path)
  local _path = path or vim.fn.input("Dir: ", "", "dir")
  require("telescope.builtin").live_grep({search_dirs = {_path}})
end
_G.telescope_files_or_git_files = function()
  local utils = require("telescope.utils")
  local builtin = require("telescope.builtin")
  local _, ret, _ = utils.get_os_command_output({"git", "rev-parse", "--is-inside-work-tree"})
  if ret == 0 then
    builtin.git_files()
  else
    builtin.find_files()
  end
end

map("n", "<leader>bl", ":Telescope buffers<CR>")
map("n", "<leader>p", ":Telescope live_grep<CR>")
map("n", "<leader>h", ":Telescope oldfiles<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>FF", ":Telescope grep_string<CR>")
map("n", "<leader>fD", ":lua telescope_live_grep_in_path()<CR>")
map("n", "<leader><space>", ":lua telescope_files_or_git_files()<CR>")
map("n", "<leader>fd", ":lua telescope_find_files_in_path()<CR>")
map("n", "<leader>ft", ':lua telescope_find_files_in_path("./tests")<CR>')
map("n", "<leader>fT", ':lua telescope_live_grep_in_path("./tests")<CR>')
map("n", "<leader>fo", ":Telescope file_browser<CR>")
map("n", "<leader>fg", ":Telescope git_branches<CR>")
map("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>")
