local dap = require('dap')
local dap_ui = require('dapui')

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug continue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug step into' })
vim.keymap.set('n', '<leader>ds', dap.step_over, { desc = 'Debug step over' })
vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Debug step out' })
vim.keymap.set('n', '<leader>dw', dap_ui.elements.watches.remove, { desc = 'Delete watch under cursor' })

