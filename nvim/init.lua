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
	{ 'folke/trouble.nvim',                 dependencies = { 'kyazdani42/nvim-web-devicons' } },
	{ 'ray-x/lsp_signature.nvim' },
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-rhubarb',                  dependencies = { 'tpope/vim-fugitive' } },
	{ 'rcarriga/nvim-notify' },
	{ 'stevearc/dressing.nvim' },
	{ 'stevearc/overseer.nvim' },
	{ 'goolord/alpha-nvim' },
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
		}
	},
})

require('Comment').setup()
require('indent_blankline').setup()
require('gitsigns').setup()
require('which-key').setup()
require('scope').setup()
require('lsp_signature').setup()
require('dressing').setup()
require('overseer').setup()
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val =
-- {
-- "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
-- "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
-- "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
-- "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
-- "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
-- "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
-- }
-- {
-- "     .-') _   ('-.                     (`-.           _   .-')    ",
-- "    ( OO ) )_(  OO)                  _(OO  )_        ( '.( OO )_  ",
-- ",--./ ,--,'(,------. .-'),-----. ,--(_/   ,. \\ ,-.-') ,--.   ,--.)",
-- "|   \\ |  |\\ |  .---'( OO'  .-.  '\\   \\   /(__/ |  |OO)|   `.'   | ",
-- "|    \\|  | )|  |    /   |  | |  | \\   \\ /   /  |  |  \\|         | ",
-- "|  .     |/(|  '--. \\_) |  |\\|  |  \\   '   /,  |  |(_/|  |'.'|  | ",
-- "|  |\\    |  |  .--'   \\ |  | |  |   \\     /__),|  |_.'|  |   |  | ",
-- "|  | \\   |  |  `---.   `'  '-'  '    \\   /   (_|  |   |  |   |  | ",
-- "`--'  `--'  `------'     `-----'      `-'      `--'   `--'   `--' ",
-- }
-- {
-- " ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
-- " ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
-- "▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
-- "▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
-- "▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
-- "░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
-- "░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
-- "   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
-- "         ░    ░  ░    ░ ░        ░   ░         ░   ",
-- "                                ░                  ",
-- }
-- {
-- "███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ",
-- "███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ",
-- "███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ",
-- "███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
-- "███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
-- "███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ",
-- "███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ",
-- " ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ",
-- }
-- {
-- " ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·. ",
-- "•█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪",
-- "▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·",
-- "██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌",
-- "▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀",
-- }
-- {
-- " ▄▀▀▄ ▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▀▀▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀█▀▄    ▄▀▀▄ ▄▀▄ ",
-- "█  █ █ █ ▐  ▄▀   ▐ █      █ █   █    █ █   █  █  █  █ ▀  █ ",
-- "▐  █  ▀█   █▄▄▄▄▄  █      █ ▐  █    █  ▐   █  ▐  ▐  █    █ ",
-- "  █   █    █    ▌  ▀▄    ▄▀    █   ▄▀      █       █    █  ",
-- "▄▀   █    ▄▀▄▄▄▄     ▀▀▀▀       ▀▄▀     ▄▀▀▀▀▀▄  ▄▀   ▄▀   ",
-- "█    ▐    █    ▐                       █       █ █    █    ",
-- "▐         ▐                            ▐       ▐ ▐    ▐    ",
-- }
-- {
-- "   ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█ ",
-- "    █  █▀   ▀  █   █      █  ██ █ █ █ ",
-- "██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ ",
-- "█ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ ",
-- "█  █ █ ▀███▀           █  █   ▐    █  ",
-- "█   ██                  █▐        ▀   ",
-- "                        ▐             ",
-- }
{
"::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::  ",
":+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+ ",
":+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+ ",
"+#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+ ",
"+#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+ ",
"#+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+# ",
"###    #### ########## ########      ###     ########### ###       ### ",
}
-- {
-- "                                                                                         .         .           ",
-- "b.             8 8 8888888888       ,o888888o.  `8.`888b           ,8'  8 8888          ,8.       ,8.          ",
-- "888o.          8 8 8888          . 8888     `88. `8.`888b         ,8'   8 8888         ,888.     ,888.         ",
-- "Y88888o.       8 8 8888         ,8 8888       `8b `8.`888b       ,8'    8 8888        .`8888.   .`8888.        ",
-- ".`Y888888o.    8 8 8888         88 8888        `8b `8.`888b     ,8'     8 8888       ,8.`8888. ,8.`8888.       ",
-- "8o. `Y888888o. 8 8 888888888888 88 8888         88  `8.`888b   ,8'      8 8888      ,8'8.`8888,8^8.`8888.      ",
-- "8`Y8o. `Y88888o8 8 8888         88 8888         88   `8.`888b ,8'       8 8888     ,8' `8.`8888' `8.`8888.     ",
-- "8   `Y8o. `Y8888 8 8888         88 8888        ,8P    `8.`888b8'        8 8888    ,8'   `8.`88'   `8.`8888.    ",
-- "8      `Y8o. `Y8 8 8888         `8 8888       ,8P      `8.`888'         8 8888   ,8'     `8.`'     `8.`8888.   ",
-- "8         `Y8o.` 8 8888          ` 8888     ,88'        `8.`8'          8 8888  ,8'       `8        `8.`8888.  ",
-- "8            `Yo 8 888888888888     `8888888P'           `8.`           8 8888 ,8'         `         `8.`8888. ",
-- }
dashboard.section.buttons.val = {
    dashboard.button("l", "  Last Session", ""),
    dashboard.button("s", "  Saved Sessions", ""),
	dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  Find File", ""),
    dashboard.button("w", "  Find Word", ""),
    dashboard.button("'", "  Bookmarks", ""),
	dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}
alpha.setup(dashboard.config)

require("notify").setup({
	background_colour = "#000000",
})
vim.notify = require('notify')
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
	auto_session_allowed_dirs = { "~/Projects/*", 'C:/Projects/*' },
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
		'typescript', 'vim' },
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
	set_lsp_keymaps = false,
})
lsp.ensure_installed({
	'clangd',
	'cmake',
	'lua_ls',
	'pylsp',
})
lsp.on_attach(function(_, bufnr)
	local opts = { desc = '[F]ormat buffer', buffer = bufnr }

	vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, opts)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')
end)
lsp.nvim_workspace()
lsp.setup()
vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = false,
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
vim.cmd [[autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE]]

---------------------------------------
-- Keybindings
---------------------------------------
-- Personal
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>]', '<cmd>bnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>[', '<cmd>bprev<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<C-b>', '<cmd>OverseerRun<CR>', { desc = 'Build tasks' })
vim.keymap.set('n', '<leader>ss', require('session-lens').search_session, { desc = '[S]earch [S]essions' })
vim.keymap.set('n', '<leader>ls', function()
	local path = require('auto-session').get_latest_session():gsub("\\%%", "%%")
	require('auto-session').RestoreSession(path)
end, { desc = '[L]ast [S]ession' })
-- Autocomplete braces
vim.keymap.set('i', '(', '()<left>')
vim.keymap.set('i', '[', '[]<left>')
vim.keymap.set('i', '{', '{}<left>')
vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>O')
vim.keymap.set('i', '{;<CR>', '{<CR>};<ESC>O')
-- vim.keymap.set('i', <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
-- vim.keymap.set('i', <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
-- vim.keymap.set('i', <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
-- vim.keymap.set('i', <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
-- vim.keymap.set('i', <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

-- Comment
vim.keymap.set('n', '<C-_>', 'gcc', { desc = 'Toggle line comment' })
vim.keymap.set('v', '<C-_>', 'gc', { desc = 'Toggle line comment' })

-- Telescope
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

-- TroubleToggle
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

---------------------------------------
-- Color Scheme
---------------------------------------
vim.cmd.colorscheme('gruvbox')
-- TODO
-- welcome screen in ~
-- neotree
-- closing buffers switches to another buffer, not filetree
-- movement between open windows with ctrl hjkl
-- terminal like in astronvim
-- autobrackets? or whatever it is called in astronvim
-- folding
-- fix autocomplete with enter (now enter doesn't accept suggestion but makes a newline)
-- fix lsp_signature (function parameters not being suggested)
-- split into files
-- fix diagnostics icons
-- fix ctrl-/ not commenting lines
