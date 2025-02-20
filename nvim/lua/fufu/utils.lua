local M = {}

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
