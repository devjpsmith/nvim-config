require('nvim-highlight-colors').setup({
    render = 'virtual',
    virtual_symbol = '█',
    virtual_symbol_position = 'inline',

    ---Highlight hex colors, e.g. '#FFFFFF'
	enable_hex = true,

    	---Highlight short hex colors e.g. '#fff'
	enable_short_hex = true,

	---Highlight rgb colors, e.g. 'rgb(0 0 0)'
	enable_rgb = true,

    ---Highlight ansi colors, e.g '\033[0;34m'
	enable_ansi = true,

    ---Highlight tailwind colors, e.g. 'bg-blue-500'
	enable_tailwind = true,
})
