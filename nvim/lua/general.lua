vim.cmd([[
	colorscheme tokyonight-moon
	let g:loaded_node_provider = 0
	let g:loaded_perl_provider = 0
	let g:loaded_python3_provider = 0
	let g:loaded_ruby_provider = 0
]])
require('vim._core.ui2').enable()
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.winborder = 'bold'
vim.g.mapleader = ' '
vim.diagnostic.config({
  underline = true,
  virtual_text = {
    spacing = 4,
  },
  virtual_lines = false,
})
require('mini.indentscope').setup()
require('mini.tabline').setup()
vim.g.lazygit_floating_window_scaling_factor = 1
