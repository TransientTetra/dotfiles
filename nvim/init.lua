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
-- Set completeopt to have a better completion experience
--vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autowriteall = true
vim.o.timeout = true
vim.o.timeoutlen = 300

---------------------------------------
-- Keybindings
---------------------------------------
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', '<C-_>', 'gcc', {desc = 'Toggle line comment', remap = true})
vim.keymap.set('v', '<C-_>', 'gc', {desc = 'Toggle line comment', remap = true})

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
	{'Mofiqul/vscode.nvim'},
	{'nvim-lualine/lualine.nvim'},
	{'numToStr/Comment.nvim'},
	{'lukas-reineke/indent-blankline.nvim'},
	{'akinsho/bufferline.nvim', dependencies = {'kyazdani42/nvim-web-devicons'}},
	{'nvim-tree/nvim-tree.lua'},
	{'lewis6991/gitsigns.nvim'},
	{'rmagatti/auto-session'},
	-- {'glepnir/dashboard-nvim', dependencies = {'kyazdani42/nvim-web-devicons'}},
	-- {'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
	-- {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	-- {'akinsho/toggleterm.nvim', version = '*', config = true}
	-- {'folke/which-key.nvim'},
})

require('lualine').setup({
	options = {
		component_separators = '|',
		section_separators = {left = '', right = ''},
	}
})
require('Comment').setup()
require('indent_blankline').setup()
require('bufferline').setup()
require('nvim-tree').setup()
require('gitsigns').setup()
require('nvim-web-devicons').setup()
require('auto-session').setup({
	log_level = 'none',
})

---------------------------------------
-- Color Scheme
---------------------------------------
vim.cmd.colorscheme('vscode')

