local mason_dap = require('mason-nvim-dap')
require("nvim-dap-virtual-text").setup()
mason_dap.setup({
    automatic_installation = true,
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

require('config.dap.javascript')
require('config.dap.keymaps')
