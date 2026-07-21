local themes = vim.fn.getcompletion('', 'color')

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local colors = require('config/colors')
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

vim.keymap.set("n", "<leader>th", function()
    local original_theme = vim.g.colors_name

    pickers.new({}, {
        prompt_title = "Themes",

        finder = finders.new_table({
            results = themes,
        }),

        sorter = conf.generic_sorter({}),

        attach_mappings = function(prompt_bufnr)
            local preview_theme = function(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                if entry then
                    pcall(vim.cmd.colorscheme, entry[1])
                end
            end

            actions.move_selection_next:enhance({
                post = function()
                    preview_theme(prompt_bufnr)
                end,
            })

            actions.move_selection_previous:enhance({
                post = function()
                    preview_theme(prompt_bufnr)
                end,
            })

            actions.close:enhance({
                pre = function()
                    pcall(vim.cmd.colorscheme, original_theme)
                end,
            })

            actions.select_default:replace(function()
                local entry = action_state.get_selected_entry()

                actions.close(prompt_bufnr)

                colors.set_theme(entry[1])
                -- save theme here if desired
            end)
        return true
    end,
}):find()
    end
)
