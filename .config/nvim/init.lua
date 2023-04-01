if vim.g.vscode then
	-- VSCode extension
	vim.keymap.set("i", "jj", "<ESC>")
else
	cmd = vim.cmd
	g = vim.g --global variable
	opt = vim.opt
	o = vim.o --global options
	wo = vim.wo
	bo = vim.bo

	function map(mode, lhs, rhs, opts)
		local options = { noremap = true }
		if opts then
			options = vim.tbl_extend("force", options, opts)
		end
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	end

	require("plugins")
	require("keymapping")
	require("config")
	require("settings/lualine")
	require("settings/term")
	require("settings/commentary")
	require("settings/undoTreeCfg")
	require("settings/gitSignCfg")
	require("settings/telescopeCfg")
	require("settings/lspCfg")
	require("settings/dapCfg")
	require("settings/jestCfg")
	require("settings/fugitiveCfg")
	require("settings/autotagCfg")
	require("settings/treesitterCfg")
	require("settings/colorizerCfg")
	require("settings/hopCfg")
	require("settings/diffviewCfg")
	require("settings/nvimTree")
	-- require("settings/fmtCfg")
	require("settings/goCfg")
	require("settings/nulllsCfg")
	require("settings/blanklineCfg")
	-- require("settings/bufferlineCfg")
end
