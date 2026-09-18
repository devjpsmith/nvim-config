local mason_dap = require('mason-nvim-dap')
local ui_layout = require('config.dap.ui-layout')
local nvim_tree = require('nvim-tree.api')

require("nvim-dap-virtual-text").setup()

mason_dap.setup({
    automatic_installation = true,
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup(
    {
        layouts= ui_layout
    }
)

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
    nvim_tree.tree.open()
end

dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
    nvim_tree.tree.open()
end

require('config.dap.javascript')
require('config.dap.keymaps')
