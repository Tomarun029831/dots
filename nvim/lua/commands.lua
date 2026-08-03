vim.api.nvim_create_user_command('Config', function ()
	vim.cmd.edit(vim.fn.stdpath('config'))
end, {nargs=0, desc="open config dir"})

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
		if #orphans == 0 then return end
		vim.pack.del(orphans)
	end
end, {nargs=0})
