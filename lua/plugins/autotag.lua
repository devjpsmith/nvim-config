return {
    'windwp/nvim-ts-autotag',
    lazy = false,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        require('config.autotag')
    end,
}
