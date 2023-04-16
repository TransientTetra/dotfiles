return {
	{
		'rmagatti/auto-session',
		opts = {
			log_level = 'none',
			auto_session_create_enabled = false,
			auto_save_enabled = true,
			auto_restore_enabled = true,
		},
	},
	{
		'rmagatti/session-lens',
		dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
		opts = {
			path_display = { 'shorten' },
		},
	},
}
