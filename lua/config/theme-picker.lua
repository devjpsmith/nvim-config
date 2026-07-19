local themes = {
    'base46-aquarium',
    'base46-ashes',
    'base46-aylin',
}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local colors = require('config/colors')

vim.keymap.set("n", "<leader>th", function()
    pickers.new({}, {
        prompt_title = "Themes",

        finder = finders.new_table({
            results = themes,
        }),

        sorter = conf.generic_sorter({}),

        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()

                actions.close(prompt_bufnr)

                colors.set_theme(selection[1])
                -- vim.cmd.colorscheme(selection[1])
            end)

            return true
        end,
    }):find()
end)
