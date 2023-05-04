return {
	{
		'jay-babu/mason-nvim-dap.nvim',
		dependencies = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' },
		opts = {
			ensure_installed = { 'cppdbg', 'python' },
		},
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		dependencies = { 'mfussenegger/nvim-dap', 'nvim-treesitter/nvim-treesitter' },
		opts = {},
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = { 'mfussenegger/nvim-dap' },
		opts = {},
	},
	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap = require('dap')
			dap.adapters.cppdbg = {
				id = 'cppdbg',
				type = 'executable',
				command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7'
			}
			local CPPDBG_CONFIG = {
				{
					name = 'Launch file',
					type = 'cppdbg',
					request = 'launch',
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					text = '-enable-pretty-printing',
					description = 'enable pretty printing',
					ignoreFailures = false,
				},
			}
			dap.configurations.cpp = CPPDBG_CONFIG
			dap.configurations.c = CPPDBG_CONFIG
			dap.configurations.rust = CPPDBG_CONFIG

			vim.api.nvim_set_hl(0, "DapStoppedLinehl", { bg = "#555530" })
		end
	},
}
