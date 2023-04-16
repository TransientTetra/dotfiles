return {
	'nvim-tree/nvim-tree.lua',
	opts = {
		git = {
			ignore = false,
		},
		renderer = {
			highlight_modified = 'name',
			highlight_git = true,
		},
		modified = {
			enable = true,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			severity = {
				min = vim.diagnostic.severity.ERROR,
			},
		},
	}
}
