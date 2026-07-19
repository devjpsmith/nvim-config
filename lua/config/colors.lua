local theme_file = vim.fn.stdpath("data") .. "/theme.txt"

local colors = {}

function colors.set_theme(theme)
    vim.cmd.colorscheme(theme)

    vim.fn.writefile({ theme }, theme_file)
end

function colors.load_theme()
    if vim.fn.filereadable(theme_file) == 1 then
        local theme = vim.fn.readfile(theme_file)[1]
        vim.cmd.colorscheme(theme)
    end
end

--load_theme()

return colors
