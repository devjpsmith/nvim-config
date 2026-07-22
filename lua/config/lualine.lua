require('lualine').setup({
    options = {
        theme = 'base46-palenight',

    },
    sections = {
        lualine_c = {
            {
                'filename',
                file_statue = true,
                newfile_statue = false,
                path = 1,
                shortening_target = 40,
            }
        },
    },
})
