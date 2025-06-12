local M = {}

-- if we are in the plugin_path, we run plugin in development mode, so we are using local config instead of github one (and we can see changes live)
M.apply_dev_mode = function(config, plugin_path)
	local use_local = vim.fn.getcwd() == vim.fn.expand(plugin_path)
	if use_local then
		config[2] = {
			dir = plugin_path,
			config = true,
		}
	end

	return config
end

M.get_active_lsp_clients = function()
	local clients = {}
	for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
		if client.root_dir ~= nil then
			clients[client.name] = true
		end
	end
	return clients
end

return M
