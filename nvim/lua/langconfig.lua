local lang_configs = {
	{ filetypes = { 'lua' }, lsp = 'lua_ls', treesitters = { 'lua' } },
	{ filetypes = { 'c', 'cpp' }, lsp = 'clangd', treesitters = { 'c', 'cpp' } },
	{ filetypes = { 'cmake' }, lsp = 'cmake', treesitters = { 'cmake' } },
	{ filetypes = { 'nu' }, lsp = 'nushell', external = true, treesitters = { 'nu' } },
	{ filetypes = { 'html' }, lsp = 'html', treesitters = { 'html' } },
	{ filetypes = { 'css', 'scss' }, lsp = 'cssls', treesitters = { 'css', 'scss' } },
	{
		filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
		lsp = 'ts_ls',
		treesitters = { 'javascript', 'typescript', 'tsx' },
	},
	{ filetypes = { 'markdown' }, lsp = nil, treesitters = { 'markdown', 'markdown_inline' } },
}

local lsps = {}
local mason_lsps = {}
local treesitters = {}
local filetypes = {}

for _, config in ipairs(lang_configs) do
	if config.lsp then
		table.insert(lsps, config.lsp)
		local is_under_mason = not config.external
		if is_under_mason then
			table.insert(mason_lsps, config.lsp)
		end
	end

	for _, ts in ipairs(config.treesitters) do
		table.insert(treesitters, ts)
	end
	for _, ft in ipairs(config.filetypes) do
		table.insert(filetypes, ft)
	end
end

return {
	lsps = lsps,
	mason_lsps = mason_lsps,
	treesitters = treesitters,
	filetypes = filetypes,
}
