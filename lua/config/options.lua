vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true

vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.whichwrap:append({
    ["<"] = true,
    [">"] = true,
    ["["] = true,
    ["]"] = true,
    h = true,
    l = true,
})
vim.api.nvim_create_autocmd({"TextChanged", "InsertLeave"}, {
    pattern = "*",
    command = "silent! update",
})

