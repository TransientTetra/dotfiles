-- Vim settings
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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keybindings
vim.g.mapleader = ' '
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', '<C-_>', 'gcc', {desc = 'Toggle line comment', remap = true})
vim.keymap.set('v', '<C-_>', 'gc', {desc = 'Toggle line comment', remap = true})

-- Plugins
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
	{"lukas-reineke/indent-blankline.nvim"},
	-- {'akinsho/toggleterm.nvim'},
	{'akinsho/bufferline.nvim'},
	{'nvim-tree/nvim-tree.lua'},
	{'lewis6991/gitsigns.nvim'},
	{'kyazdani42/nvim-web-devicons'},
})
require('lualine').setup({
	options = {
		component_separators = '|',
		section_separators = { left = '', right = '' },
	}
})
require('Comment').setup()
require('indent_blankline').setup()
-- require('toggleterm').setup()
require('bufferline').setup()
require('nvim-tree').setup()
require('gitsigns').setup()
require('nvim-web-devicons').setup()

-- Color Scheme
vim.cmd.colorscheme('vscode')

