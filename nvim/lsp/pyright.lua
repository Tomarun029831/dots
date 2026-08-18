local function getPythonPath()
	local cwd = vim.fn.getcwd()
	-- for pyrightconfig
	local config_path = cwd .. "/pyrightconfig.json"
	if vim.fn.filereadable(config_path) == 1 then
		local f = io.open(config_path, "r")
		if f then
			local content = f:read("*a")
			f:close()
			local ok, decoded = pcall(vim.json.decode, content)
			if ok and decoded and decoded.pythonPath then
				return decoded.pythonPath
			end
		end
	end

	-- for uv(python package manager)
	local venv_bin = vim.fn.has("win32") == 1 and "/Scripts/python.exe" or "/bin/python"
	local venv_exe = cwd .. "/.venv" .. venv_bin
	if vim.fn.executable(venv_exe) == 1 then
		return venv_exe
	end

	-- default
	return "python"
end

return {
	settings = { python = { pythonPath = getPythonPath() } }
}
