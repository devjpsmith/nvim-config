local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
    desc = "Toggle file explorer",
})

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<leader>fg", function()
    require("telescope").extensions.live_grep_args.live_grep_args()
end, {
desc = "Live grep args",
})
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Buffer navigation
vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })

-- Exit terminal mode with a single Escape press
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set('n', '`', function()
    local size = vim.v.count
    if size == 0 then
        size = 20
    end
    vim.cmd('ToggleTerm dir=. direction=horizontal name=terminal size=' .. size)
end, { desc = 'Toggle terminal' })

-- Window navigation from terminal mode
vim.keymap.set({ 't', 'n' }, '<C-h>', [[<C-\><C-n><C-w>h]], { desc = "Move left" })
vim.keymap.set({ 't', 'n' }, '<C-j>', [[<C-\><C-n><C-w>j]], { desc = "Move down" })
vim.keymap.set({ 't', 'n' }, '<C-k>', [[<C-\><C-n><C-w>k]], { desc = "Move up" })
vim.keymap.set({ 't', 'n' }, '<C-l>', [[<C-\><C-n><C-w>l]], { desc = "Move right" })

local dap = require("dap")

vim.keymap.set("n", "<F5>", function()
    require('nvim-tree.api').tree.close()
    dap.continue()
end)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dr", dap.repl.open)

