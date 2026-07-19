local telescope = require("telescope")

telescope.setup({
    extensions = {
        live_grep_args = {
            auto_quoting = true,

            mappings = {
                i = {
                    ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                    ["<C-i>"] = require("telescope-live-grep-args.actions").to_fuzzy_refine,
                },
            },
        },
    },
})

telescope.load_extension("live_grep_args")
