local dap_dependencies = require('config.dap_dependencies')

return {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',

    dependencies = dap_dependencies,

    config = function()
        require('config.dap')
    end,
}
