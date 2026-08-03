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
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>')
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
-- use features of a lsp
-- type ':map gr' to see the keybind
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
	end,
})

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
local function get_root()
  local root = vim.fs.root(0, { '.git', 'Cargo.toml', 'package.json', 'Makefile' })
  return root or vim.fn.getcwd()
end
vim.keymap.set('n', '<leader>e', function ()
		if MiniFiles.close() == nil then MiniFiles.open(vim.api.nvim_buf_get_name(0)) end
end)
vim.keymap.set('n', '<leader> ', function ()
	MiniPick.builtin.files(nil, {source = {cwd=get_root()}})
end)
vim.keymap.set('n', '<leader>/', function ()
	MiniPick.builtin.grep_live(nil, {source = {cwd=get_root()}})
end)
-- open lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGitCurrentFile<CR>')

