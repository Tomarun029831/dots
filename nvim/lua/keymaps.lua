require('mini.surround').setup()
require('mini.pick').setup({
	delay = {
		async = 10,
		busy = 50
	},
	mappings = {
	    move_down = '<Tab>',
		move_up = '<S-Tab>',
		toggle_info = '<C-n>',
		toggle_preview = '<C-p>'
	}
})

-- cursor movements on windows
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- change a buffer
vim.keymap.set('n', 'L', '<cmd>bnext<CR>')
vim.keymap.set('n', 'H', '<cmd>bprevious<CR>')
-- open diagnostic
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>x', function ()
		for _, win in ipairs(vim.fn.getwininfo()) do
				if win.quickfix == 1 and win.loclist == 0 then
						vim.cmd('cclose')
						return
				end
		end
		vim.diagnostic.setqflist()
end)
-- open todo-list
vim.keymap.set('n', '<leader>t', function ()
		for _, win in ipairs(vim.fn.getwininfo()) do
				if win.quickfix == 1 and win.loclist == 0 then
						vim.cmd('cclose')
						return
				end
		end
		vim.cmd('TodoQuickFix')
end)
-- toggle file explore
vim.keymap.set('n', '<leader>e', function ()
		if MiniFiles.close() == nil then MiniFiles.open() end
end)
vim.keymap.set('n', '<leader> ', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>/', MiniPick.builtin.grep_live)
-- open lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>')

