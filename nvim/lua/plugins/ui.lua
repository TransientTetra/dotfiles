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
	{
		'folke/which-key.nvim',
		opts = {
			icons = { group = vim.g.icons_enabled and '' or '+', separator = '' },
			disable = { filetypes = { 'TelescopePrompt' } },
		},
		config = function(_, opts)
			local wk_avail, wk = pcall(require, 'which-key')
			if wk_avail then
				wk.setup(opts)
				wk.register({
					f = { name = '󰍉 Find' },
					p = { name = '󰏖 Packages' },
					l = { name = ' LSP' },
					u = { name = ' UI' },
					b = { name = '󰓩 Buffers' },
					d = { name = ' Debugger' },
					g = { name = '󰊢 Git' },
					s = { name = '󱂬 Session' },
					t = { name = ' Terminal' },
					x = { name = '󱠪 Trouble' },
					o = { name = ' Overseer' },
				}, { prefix = '<leader>' })
			end
		end
	},
}
