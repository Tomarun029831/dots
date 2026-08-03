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
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.o.swapfile = false
vim.o.winborder = 'bold'
vim.g.mapleader = ' '
require('mini.indentscope').setup()
require('mini.tabline').setup()
require('mini.diff').setup()
vim.g.lazygit_floating_window_scaling_factor = 1

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		spacing = 4,
	},
	virtual_lines = false,
})
require('todo-comments').setup()
local qf_auto_update_group = vim.api.nvim_create_augroup("QFAutoUpdate", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = qf_auto_update_group,
	callback = function()
		for _, win in ipairs(vim.fn.getwininfo()) do
			local is_normal = not (win.quickfix == 1 and win.loclist == 0)
			if is_normal then goto continue end
			if vim.w[win.winid].quickfix_title == 'Diagnostics' then
				vim.diagnostic.setqflist()
			else
				vim.cmd("TodoQuickFix")
			end
			::continue::
		end
	end,
})

vim.api.nvim_create_user_command('UpdatePlugins', function ()
	vim.pack.update()
end, {nargs=0, desc = "To confirm all updates execute :write. To discard updates execute :quit."})
vim.api.nvim_create_user_command('RefreshPlugins', function()
	if vim.pack.get then
		local orphans = {}
		for _, pack in ipairs(vim.pack.get()) do
			if pack.active then goto continue end
			table.insert(orphans, pack.spec.name)
			::continue::
		end

		if #orphans > 0 then
			vim.pack.del(orphans)
		end
	end
end, {nargs=0})

