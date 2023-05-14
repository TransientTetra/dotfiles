return {
	{ 'ray-x/lsp_signature.nvim', opts = {} },
	{ 'folke/trouble.nvim',       dependencies = { 'nvim-tree/nvim-web-devicons' } },
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				'williamboman/mason.nvim',
				opts = {
					ui = {
						border = 'rounded',
					},
				},
			},                  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' }, -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		},
		config = function()
			local lsp = require('lsp-zero').preset({
				name = 'recommended',
				set_lsp_keymaps = false,
			})
			lsp.ensure_installed({
				'clangd',
				'cmake',
				'lua_ls',
				'pylsp',
			})
			lsp.on_attach(function(_, bufnr)
				require('user.keymaps').lspKeymaps(bufnr)
			end)
			lsp.nvim_workspace()
			lsp.setup()
			vim.diagnostic.config({
				virtual_text = true,
				update_in_insert = false,
				float = {
					border = 'rounded',
				},
			})
			local cmp = require('cmp')
			local border_opts = {
				border = 'rounded',
				winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
			}
			cmp.setup({
				mapping = {
					['<cr>'] = cmp.mapping.confirm({ select = false }),
				},
				formatting = {
					format = require('lspkind').cmp_format()
				},
				sources = cmp.config.sources {
					{ name = 'nvim_lsp', priority = 1000 },
					{ name = 'luasnip',  priority = 750 },
					{ name = 'buffer',   priority = 500 },
					{ name = 'path',     priority = 250 },
				},
				window = {
					completion = cmp.config.window.bordered(border_opts),
					documentation = cmp.config.window.bordered(border_opts),
				},
				snippet = {
					expand = function(args) require('luasnip').lsp_expand(args.body) end,
				},
			})
		end
	},
}
