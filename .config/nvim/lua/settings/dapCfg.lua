-- mfussenegger/nvim-dap
local dap = require("dap")

--javascript
dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/.local/share/nvim/dap/vscode-node-debug2/out/src/nodeDebug.js"}
}
dap.configurations.javascript = {
  {
    name = "Launch",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal"
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = "Attach to process",
    type = "node2",
    request = "attach",
    processId = require "dap.utils".pick_process
  }
}

--JSX, TSX
dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/.local/share/nvim/dap/vscode-chrome-debug/out/src/chromeDebug.js"}
}

dap.configurations.javascriptreact = {
  -- change this to javascript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  }
}

dap.configurations.typescriptreact = {
  -- change to typescript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  }
}

--go
dap.adapters.go = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/.local/share/nvim/dap/vscode-go/dist/debugAdapter.js"}
}
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    showLog = true,
    program = "${file}",
    console = "integratedTerminal",
    dlvToolPath = vim.fn.exepath(os.getenv("HOME") .. "/go/bin/dlv") -- Adjust to where delve is installed
  }
}

-- require('dap').set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = "80vsplit new"
vim.fn.sign_define("DapBreakpoint", {text = "🟥", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointRejected", {text = "🟦", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped", {text = "⭐️", texthl = "", linehl = "", numhl = ""})

-- _G.shutDownDapSession = function()
--   local dap = require'dap'
--   dap.terminate()
--   dap.disconnect( { terminateDebuggee = true })
--   dap.close()
-- end

map("n", "<leader>dh", ':lua require"dap".toggle_breakpoint()<CR>')
map("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<c-s-left>", ':lua require"dap".step_out()<CR>')
map("n", "<c-s-down>", ':lua require"dap".step_into()<CR>')
map("n", "<c-s-up>", ':lua require"dap".step_over()<CR>')
map("n", "<c-s-right>", ':lua require"dap".continue()<CR>')
map("n", "<leader>dn", ':lua require"dap".run_to_cursor()<CR>')
map("n", "<leader>dk", ':lua require"dap".up()<CR>')
map("n", "<leader>dj", ':lua require"dap".down()<CR>')
map("n", "<leader>dc", ':lua require"dap".terminate()<CR>')
map("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map("n", "<leader>de", ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map("n", "<leader>da", ':lua require"debugHelper".attach()<CR>')
map("n", "<leader>dA", ':lua require"debugHelper".attachToRemote()<CR>')
map("n", "<leader>di", ':lua require"dap.ui.widgets".hover()<CR>')
map("n", "<leader>d?", ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- nvim-telescope/telescope-dap.nvim
require("telescope").load_extension("dap")
map("n", "<leader>ds", ":Telescope dap frames<CR>")
-- map('n', '<leader>dc', ':Telescope dap commands<CR>')
map("n", "<leader>db", ":Telescope dap list_breakpoints<CR>")

-- theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
require("nvim-dap-virtual-text").setup()
require("dapui").setup()
map("n", "<leader>dq", ':lua require"dapui".toggle()<CR>')
