return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').load_extension('session-lens')
			-- Enable telescope fzf native, if installed
			pcall(require('telescope').load_extension, 'fzf')
			local actions = require('telescope.actions')
			require('telescope').setup({
				defaults = {
					mappings = {
						i = {
							['<C-n>'] = actions.cycle_history_next,
							['<C-p>'] = actions.cycle_history_prev,
							['<C-j>'] = actions.move_selection_next,
							['<C-k>'] = actions.move_selection_previous,
						},
						n = { ['q'] = actions.close },
					},
				},
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
				},
			})
		end
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		config = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	},
}
