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

return M
