require('config.options')
require("config.lazy")
require('lualine').setup()
require('config.keymaps')

require('bufferline').setup({
    options = {
        sort_by = 'insert_after_current',
        persist_buffer_sort = true,
    }
})
require('telescope').setup({
    defaults = {
        debug = true,
    },
})

require('config.theme-picker')
local colors = require('config/colors')

colors.load_theme()
