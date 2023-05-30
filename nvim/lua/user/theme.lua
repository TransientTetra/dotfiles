---------------------------------------
-- Color Scheme
---------------------------------------

-- remove tildes from end of buffer
vim.opt.fillchars = { eob = ' ' }

vim.cmd.colorscheme('vscode')

vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#993939' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef' })
vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379' })
