--Undotree persistent setting

map('n','<leader>u',':UndotreeToggle<CR>')
if vim.fn.has("persistent_undo")==1 then
   local target_path=vim.fn.expand('~/.undodir')

    -- create the directory and any parent directories
    -- if the location does not exist.
    if vim.fn.isdirectory(target_path)==0 then
         vimfn.mkdir(target_path, "p", 0700)
    end

    o['undodir'] = target_path
    bo.undofile = true
end

