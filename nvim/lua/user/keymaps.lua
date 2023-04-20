---------------------------------------
-- Keymaps
---------------------------------------
-- General
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>]', '<cmd>bnext<cr>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>[', '<cmd>bprev<cr>', { desc = 'Previous tab' })
vim.keymap.set('i', '<C-h>', '<left>', { desc = 'Move cursor left' })
vim.keymap.set('i', '<C-j>', '<down>', { desc = 'Move cursor down' })
vim.keymap.set('i', '<C-k>', '<up>', { desc = 'Move cursor up' })
vim.keymap.set('i', '<C-l>', '<right>', { desc = 'Move cursor right' })

-- Splits
vim.keymap.set('n', '|', '<cmd>vsplit<cr>', { desc = 'Vertical split' })
vim.keymap.set('n', '\\', '<cmd>split<cr>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<C-x>', '<C-w>q', { desc = 'Close current split' })
vim.keymap.set('n', '<C-X>', '<C-w>o', { desc = 'Close all but the current split' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to below split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to above split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })
vim.keymap.set('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Resize split up' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Resize split down' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Resize split left' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Resize split right' })

local IsAvailable = require('user.utils').IsAvailable
-- Overseer
if IsAvailable('overseer.nvim') then
	vim.keymap.set('n', '<C-b>', '<cmd>OverseerRun<cr>', { desc = 'Build tasks' })
end

-- File explorer
if IsAvailable('nvim-tree.lua') then
	vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file explorer' })
end

-- Session
if IsAvailable('session-lens') then
	vim.keymap.set('n', '<leader>sb', require('session-lens').search_session, { desc = 'Browse saved sessions' })
end
if IsAvailable('auto-session') then
	vim.keymap.set('n', '<leader>ss', require('auto-session').SaveSession, { desc = 'Save session' })
	vim.keymap.set('n', '<leader>sD', require('auto-session').DeleteSession, { desc = 'Delete current session' })
	vim.keymap.set('n', '<leader>sd', '<cmd>Autosession delete<cr>', { desc = 'Browse and delete a session' })
	vim.keymap.set('n', '<leader>sl', require('user.utils').RestoreLatestSession, { desc = 'Load most recent session' })
end

-- Comment
if IsAvailable('Comment.nvim') then
	vim.keymap.set('n', '<C-_>', 'gcc', { desc = 'Toggle line comment', remap = true })
	vim.keymap.set('v', '<C-_>', 'gc', { desc = 'Toggle line comment', remap = true })
	vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle line comment', remap = true })
	vim.keymap.set('v', '<leader>/', 'gc', { desc = 'Toggle line comment', remap = true })
end

-- Telescope
if IsAvailable('telescope.nvim') then
	vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
	vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
	vim.keymap.set('n', '<leader>fb', function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 10,
			previewer = false,
		})
	end, { desc = 'Fuzzily search in current buffer' })
	vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files' })
	vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Find help' })
	vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Find current word' })
	vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Find by grep' })
	vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Find diagnostics' })
end

-- TroubleToggle
if IsAvailable('trouble.nvim') then
	vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
	vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true, noremap = true })
	vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true, noremap = true })
	vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { silent = true, noremap = true })
	vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { silent = true, noremap = true })
	vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', { silent = true, noremap = true })
end
return {
	lspKeymaps = function(bufnr)
		vim.keymap.set({ 'n', 'x' }, '<leader>lf',
			function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
			{ buffer = bufnr, desc = 'Format buffer' })

		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code action' })

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Goto definition' })
		vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,
			{ buffer = bufnr, desc = 'Goto references' })
		vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Goto implementation' })
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Type definition' })
		vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
			{ buffer = bufnr, desc = 'Document symbols' })
		vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
			{ buffer = bufnr, desc = 'Workspace symbols' })

		-- See `:help K` for why this keymap
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover documentation' })
		vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help,
			{ buffer = bufnr, desc = 'Signature documentation' })

		-- Lesser used LSP functionality
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Goto declaration' })
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
			{ buffer = bufnr, desc = 'Workspace add folder' })
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
			{ buffer = bufnr, desc = 'Workspace remove folder' })
		vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
			{ buffer = bufnr, desc = 'Workspace list folders' })
	end
}
