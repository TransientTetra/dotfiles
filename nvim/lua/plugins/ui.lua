return {
	'morhetz/gruvbox',
	'catppuccin/nvim',
	'rebelot/kanagawa.nvim',
	'folke/tokyonight.nvim',
	'sainnhe/everforest',
	'navarasu/onedark.nvim',
	'shaunsingh/nord.nvim',
	'junegunn/seoul256.vim',
	'Mofiqul/vscode.nvim',
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
			sections = { lualine_c = { require('auto-session.lib').current_session_name } },
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
			window = {
				border = 'rounded',
			},
		},
	},
	{
		'onsails/lspkind.nvim',
		opts = {
			mode = 'symbol',
			symbol_map = {
				Array = '󰅪',
				Boolean = '⊨',
				Constructor = '',
				Key = '󰌆',
				Namespace = '󰅪',
				Null = 'NULL',
				Number = '#',
				Object = '󰀚',
				Package = '󰏗',
				Reference = '',
				Snippet = '',
				String = '󰀬',
				TypeParameter = '󰊄',
				Unit = '',
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Color = "󰏘",
				File = "󰈙",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
			},
		},
		enabled = vim.g.icons_enabled,
		config = function(_, opts)
			require('lspkind').init(opts)
		end,
	},
	{
		'xiyaowong/transparent.nvim',
		opts = {
			groups = { -- table: default groups
				'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
				'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
				'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
				'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'Folded', 'SpecialKey', 'VertSplit', 'EndOfFile',
			},
			extra_groups = {
				'NormalFloat', 'NvimTreeNormal', 'BufferLineTab', "GitGutterAdd", "GitGutterChange", "GitGutterDelete",
			},          -- table: additional groups that should be cleared
			exclude_groups = {}, -- table: groups you don't want to clear
		}
	},
}
