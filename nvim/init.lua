---------------------------------------
-- Vim settings
---------------------------------------
vim.g.mapleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autowriteall = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.scrolloff = 4
vim.o.updatetime = 250

---------------------------------------
-- Plugins
---------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ 'morhetz/gruvbox' },
	{ 'nvim-lualine/lualine.nvim' },
	{ 'numToStr/Comment.nvim' },
	{ 'lukas-reineke/indent-blankline.nvim' },
	{ 'akinsho/bufferline.nvim',            dependencies = { 'kyazdani42/nvim-web-devicons' } },
	{ 'nvim-tree/nvim-tree.lua' },
	{ 'lewis6991/gitsigns.nvim' },
	{ 'nvim-telescope/telescope.nvim',      dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'rmagatti/auto-session' },
	{ 'rmagatti/session-lens',              dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' } },
	{ 'folke/which-key.nvim' },
	{ 'tpope/vim-sleuth' },
	{ 'tiagovla/scope.nvim' },
	{ 'ray-x/lsp_signature.nvim' },
	{ 'akinsho/toggleterm.nvim',            version = '*',                                                            config = true },
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		config = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },       -- Required
			{ 'williamboman/mason.nvim' },     -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },   -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' },   -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },       -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	},
})

require('Comment').setup()
require('indent_blankline').setup()
require('gitsigns').setup()
require('toggleterm').setup()
require('which-key').setup()
require('scope').setup()
require('lsp_signature').setup()
require('nvim-tree').setup({
	git = {
		ignore = false,
	},
	renderer = {
		highlight_modified = "name",
		highlight_git = true,
	},
	modified = {
		enable = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
	},
})
require('lualine').setup({
	options = {
		component_separators = '|',
		section_separators = { left = '', right = '' },
	},
	sections = { lualine_c = { require('auto-session-library').current_session_name } },
})
require('bufferline').setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true -- use a "true" to enable the default, or set your own character
			}
		}
	}
})
require('auto-session').setup({
	log_level = 'none',
})
require('telescope').setup({
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
})
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
require('session-lens').setup({
	path_display = { 'shorten' },
})
require('telescope').load_extension('session-lens')
require('nvim-treesitter.configs').setup({
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = { 'c', 'cpp', 'lua', 'python', 'rust', 'tsx', 'vue', 'javascript',
		'typescript', 'help', 'vim' },
	-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
	auto_install = false,
	highlight = { enable = true },
	indent = { enable = true, disable = { 'python' } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<M-space>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
})

local lsp = require('lsp-zero').preset({
	name = 'recommended',
})
-- lsp.ensure_installed({
--     'autopep8',
--     'clang-format',
--     'clangd',
--     'cmakelang',
--     'cpplint',
--     'lua-language-server',
--     'marksman',
--     'pydocstyle',
--     'pylint',
--     'python-lsp-server',
--     'selene',
--     'stylua',
-- })
-- (Optional) Configure lua language server for neovim
lsp.on_attach(function(user, bufnr)
	local opts = { desc = '[F]ormat buffer', buffer = bufnr }

	vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, opts)
end)
lsp.nvim_workspace()
lsp.setup()
vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	float = true,
})

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

---------------------------------------
-- Keybindings
---------------------------------------
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>', { desc = 'Save' })

vim.keymap.set('n', '<C-_>', 'gcc', { desc = 'Toggle line comment', remap = true })
vim.keymap.set('v', '<C-_>', 'gc', { desc = 'Toggle line comment', remap = true })

vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { desc = '[T]oggle terminal' })

vim.keymap.set('n', '<leader>]', ':bnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>[', ':bprev<CR>', { desc = 'Previous tab' })

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>ss', require('session-lens').search_session, { desc = '[S]earch [S]essions' })

---------------------------------------
-- Color Scheme
---------------------------------------
vim.cmd.colorscheme('gruvbox')
