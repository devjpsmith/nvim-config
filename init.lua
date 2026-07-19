vim.wo.number = true
require('config.options')
require("config.lazy")
require('lualine').setup()
require('config.keymaps')

require('telescope').setup({
    defaults = {
        debug = true,
    },
})

require('config.theme-picker')
local colors = require('config/colors')

colors.load_theme()

--vim.cmd.colorscheme('base46-default-dark')
