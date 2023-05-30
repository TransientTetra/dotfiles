return {
	{
		'Civitasv/cmake-tools.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		opts = {
			cmake_build_directory = 'build',
			cmake_soft_link_compile_commands = false,
		}
	}
}
