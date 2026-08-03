local lang_configs = {
	{ filetypes = { 'lua' }, lsp = 'lua_ls', treesitters = { 'lua' } },
	{ filetypes = { 'c', 'cpp' }, lsp = 'clangd', treesitters = { 'c', 'cpp' } },
	{ filetypes = { 'nu' }, lsp = nil, treesitters = { 'nu' } },
	{ filetypes = { 'html' }, lsp = 'html', treesitters = { 'html' } },
	{ filetypes = { 'css', 'scss' }, lsp = 'cssls', treesitters = { 'css', 'scss' } },
	{
		filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
		lsp = 'ts_ls',
		treesitters = { 'javascript', 'typescript', 'tsx' },
	},
	{ filetypes = { 'markdown' }, lsp = nil, treesitters = { 'markdown', 'markdown_inline' } },
}

local lsp_servers = {}
local treesitters = {}
local filetypes = {}

for _, config in ipairs(lang_configs) do
	if config.lsp then
		table.insert(lsp_servers, config.lsp)
	end
	for _, ts in ipairs(config.treesitters) do
		table.insert(treesitters, ts)
	end
	for _, ft in ipairs(config.filetypes) do
		table.insert(filetypes, ft)
	end
end

return {
	lsp_servers = lsp_servers,
	treesitters = treesitters,
	filetypes = filetypes,
}
