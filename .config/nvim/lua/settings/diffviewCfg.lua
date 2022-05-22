-- -- TimUntersberger/neogit and sindrets/diffview.nvim
require("diffview").setup({
	win_config = {
		file_panel = {
			position = "left", -- One of 'left', 'right', 'top', 'bottom'
			width = 60, -- Only applies when position is 'left' or 'right'
		},
	},
})
