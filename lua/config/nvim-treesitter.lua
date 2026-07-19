require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath('data') .. '/site',
	ensure_installed = {
	  "html",
	},

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},
})
