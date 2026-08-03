local lang_configs = {
	{ lsp = 'lua_ls', ft = { 'lua' } },
	{ lsp = 'clangd', ft = { 'c', 'cpp' } },
	{ lsp = 'nushell', ft = { 'nu' } },
	{ lsp = nil, ft = { 'markdown', 'markdown_inline' } },
}

local lsp_servers = {}
local filetypes = {}
for _, config in ipairs(lang_configs) do
	if config.lsp then
		table.insert(lsp_servers, config.lsp)
	end
	for _, ft in ipairs(config.ft) do
		table.insert(filetypes, ft)
	end
end
return {lsp_servers=lsp_servers, filetypes=filetypes}
