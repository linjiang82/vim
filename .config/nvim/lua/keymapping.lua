g.mapleader=','
map('i','jj','<ESC>',{})
map('n','<leader>w',':w<cr>',{})
map('i','<leader>w','<esc>:w<cr>a',{})

local opts =  { noremap = true }
map('n','<c-j>','<c-w>j',opts)
map('n','<c-h>','<c-w>h',opts)
map('n','<c-k>','<c-w>k',opts)
map('n','<c-l>','<c-w>l',opts)



