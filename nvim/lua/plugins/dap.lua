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
		opts = {
			enabled = true,            -- enable this plugin (the default)
			enabled_commands = true,   -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
			highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
			highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
			show_stop_reason = true,   -- show stop reason when stopped for exceptions
			commented = false,         -- prefix virtual text with comment string
			only_first_definition = false, -- only show virtual text at first definition (if there are multiple)
			all_references = true,     -- show virtual text on all all references of the variable (not only definitions)
			-- experimental features:
			virt_text_pos = "eol",     -- position of virtual text, see `:h nvim_buf_set_extmark()`
			all_frames = true,         -- show virtual text for all stack frames not only current
			virt_lines = false,        -- show virtual lines instead of virtual text (will flicker!)
			virt_text_win_col = nil    -- position the virtual text at a fixed window column (starting from the first text column) ,
			-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
		},
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

			vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
			vim.fn.sign_define('DapBreakpointCondition', { text = '󰟃', texthl = 'DapBreakpoint' })
			vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpoint' })
			vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint' })
			vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped' })
		end
	},
}
