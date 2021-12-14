_G.term_buf_of_tab = _G.term_buf_of_tab or {}
_G.term_buf_max_nmb = _G.term_buf_max_nmb or 0
_G.toggle_terminal = function()
  local cur_tab = vim.api.nvim_get_current_tabpage()
  local term_buf = term_buf_of_tab[cur_tab]
  if term_buf ~= nil then
    local cur_buf = vim.api.nvim_get_current_buf()
    if cur_buf == term_buf then
      vim.cmd("q")
    else
      vim.cmd("vert sb" .. term_buf)
      vim.cmd(":startinsert")
    end
  else
    vim.cmd("vs | terminal")
    local cur_buf = vim.api.nvim_get_current_buf()
    _G.term_buf_max_nmb = _G.term_buf_max_nmb + 1
    vim.api.nvim_buf_set_name(cur_buf, "Terminal " .. _G.term_buf_max_nmb)
    table.insert(term_buf_of_tab, cur_tab, cur_buf)
    vim.cmd(":startinsert")
  end
end
map("n", "<leader><leader>", ":lua toggle_terminal()<CR>")
map("i", "<leader><leader>", "<ESC>:lua toggle_terminal()<CR>")
map("t", "<leader><leader>", "<c-\\><c-n>:lua toggle_terminal()<CR>")
cmd([[
if has('nvim')
   au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif]])
