---------------------------------------
-- Autocommands
---------------------------------------
-- workaround for nvim tree and autosession
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
	pattern = 'NvimTree*',
	callback = function()
		local view = require('nvim-tree.view')
		local is_visible = view.is_visible()

		local api = require('nvim-tree.api')
		if not is_visible then
			api.tree.open()
		end
	end,
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
