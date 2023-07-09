return {
	{
		'Civitasv/cmake-tools.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		opts = {
			cmake_build_directory = 'build',
			-- cmake_build_directory_prefix = 'cmake-build-',
			cmake_soft_link_compile_commands = false,
			cmake_dap_configuration = {
				name = 'cpp',
				type = 'cppdbg',
				request = 'launch',
				stopOnEntry = false,
				runInTerminal = true,
				console = 'integratedTerminal',
			},
		}
	}
}
