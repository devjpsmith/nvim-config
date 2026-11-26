local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
-- local colors = require('config/colors')

local snippet_dir = vim.fn.stdpath("config").."/lua/config/snippets"

local function get_snippets()
  local files = vim.fn.globpath(snippet_dir, "**/*", false, true)
  local snippets = {}
-- /home/james/.config/nvim/lua/config/snippets/new_ruby_file.rb
  for _, path in ipairs(files) do
    if vim.fn.filereadable(path) == 1 then
      local filename = vim.fn.fnamemodify(path, ":t")
      local name = vim.fn.fnamemodify(filename, ":r")

      -- Convert new_vue_component to New Vue Component.
      local display_name = name
        :gsub("_", " ")
        :gsub("%-", " ")
        :gsub("(%a)([%w]*)", function(first, rest)
          return first:upper() .. rest
        end)

      table.insert(snippets, {
        name = display_name,
        filename = filename,
        path = path,
      })
    end
  end

  table.sort(snippets, function(a, b)
    return a.name:lower() < b.name:lower()
  end)

  return snippets
end

local function insert_snippet(path)
  -- Read the snippet contents.
  local lines = vim.fn.readfile(path)

  -- Get the current cursor position.
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1] - 1
  local col = cursor[2]

  -- Split the current line at the cursor.
  local current_line = vim.api.nvim_get_current_line()

  local before = current_line:sub(1, col)
  local after = current_line:sub(col + 1)

  -- Insert the snippet between the two halves.
  lines[1] = before .. lines[1]
  lines[#lines] = lines[#lines] .. after

  vim.api.nvim_buf_set_lines(
    0,
    row,
    row + 1,
    false,
    lines
  )

  -- Position cursor at the end of the inserted snippet.
  local new_row = row + #lines - 1
  local new_col = #lines[#lines] - #after

  vim.api.nvim_win_set_cursor(0, {
    new_row + 1,
    new_col,
  })
end

local function snippet_previewer()
  return previewers.new_buffer_previewer({
    title = "Snippet Preview",

    define_preview = function(self, entry, status)
      local path = entry.value.path
      local bufnr = self.state.bufnr

      -- Read the snippet file.
      local lines = vim.fn.readfile(path)

      -- Populate the preview buffer.
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

      -- Detect and apply the appropriate filetype.
      local filetype = vim.filetype.match({
        filename = path,
      })

      if filetype then
        vim.bo[bufnr].filetype = filetype
      end
    end,
  })
end

vim.keymap.set("n", "<leader>fs", function()
    local snippets = get_snippets()

    pickers.new({}, {
        prompt_title = "Snippets",

        finder = finders.new_table({
            -- results = {"New File"}
            results = snippets,
            entry_maker = function(item)
                return {
                  value = item,
                  display = item.name,
                  ordinal = item.name .. " " .. item.filename,
                  filename = item.path,
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        previewer = snippet_previewer(),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()

            if not selection then
              return
            end

            local path = selection.value.path

            -- Close Telescope.
            actions.close(prompt_bufnr)

            -- Insert the snippet.
            insert_snippet(path)
          end)

          return true
        end,

    }):find()
end
)
