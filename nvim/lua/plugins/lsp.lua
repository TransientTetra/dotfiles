return {
	{ 'ray-x/lsp_signature.nvim', opts = {} },
	{ 'folke/trouble.nvim',       dependencies = { 'nvim-tree/nvim-web-devicons' } },
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
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
				float = true,
			})
			require('cmp').setup({
				mapping = {
					['<cr>'] = require('cmp').mapping.confirm({ select = false }),
				},
			})
		end
	},
}
