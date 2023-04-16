return {
	'morhetz/gruvbox',
	{
		'akinsho/bufferline.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				offsets = {
					{
						filetype = 'NvimTree',
						text = 'File Explorer',
						highlight = 'Directory',
						separator = true -- use a 'true' to enable the default, or set your own character
					}
				}
			}
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				component_separators = '|',
				section_separators = { left = '', right = '' },
			},
			sections = { lualine_c = { require('auto-session-library').current_session_name } },
		}
	},
	{ 'lukas-reineke/indent-blankline.nvim', opts = {} },
	{
		'rcarriga/nvim-notify',
		opts = { background_colour = '#000000', },
		config = function(_, opts)
			require('notify').setup(opts)
			vim.notify = require('notify')
		end
	},
	{ 'stevearc/dressing.nvim',              opts = {} },
	{ 'folke/which-key.nvim',                opts = {} },
}
