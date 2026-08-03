local lsp_servers = require('langconfig').lsp_servers

vim.lsp.enable(lsp_servers)
require('mason').setup()
local mr = require('mason-registry')
mr.refresh(function()
		for _, server in ipairs(lsp_servers) do
				if mr.has_package(server) then
						local pkg = mr.get_package(server)
						if pkg:is_installed() then goto continue end
						pkg:install()
				end
				::continue::
		end
end)
