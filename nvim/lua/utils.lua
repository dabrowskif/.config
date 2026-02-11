local Utils = {}

Utils.start_colima = function()
	local id = "colima_start"

	-- Initial notification
	vim.notify("Starting Colima...", "info", {
		id = id,
		title = "Colima",
		icon = "󰨊 ",
		timeout = false,
	})

	vim.fn.jobstart("colima start", {
		stdout_buffered = true,
		stderr_buffered = true,
		on_exit = function(_, code)
			vim.schedule(function()
				if code == 0 then
					vim.notify("Colima started successfully!", "info", {
						id = id,
						title = "Colima",
						hl = {
							title = "SnacksNotifierSuccess",
							border = "SnacksNotifierSuccess",
						},
					})
				else
					vim.notify("Failed to start Colima.", "error", {
						id = id,
						title = "Colima",
					})
				end
			end)
		end,
	})
end

local js_formatter_cache = {}

Utils.find_js_formatter = function(bufnr)
	local path = vim.api.nvim_buf_get_name(bufnr)
	-- Simple caching mechanism to avoid redundant file system checks
	if js_formatter_cache[path] then
		return js_formatter_cache[path]
	end

	local root = Utils.find_git_root()
	if not root then
		js_formatter_cache[path] = {}
		return {}
	end

	local formatterFiles = {
		biome = { ".biomerc", ".biome.json", "biome.jsonc" },
		prettier = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" },
		eslint = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" },
	}

	for formatter, files in pairs(formatterFiles) do
		for _, file in ipairs(files) do
			if vim.loop.fs_stat(root .. "/" .. file) then
				js_formatter_cache[path] = { formatter }
				return { formatter }
			end
		end
	end

	js_formatter_cache[path] = {}
	return {}
end

Utils.find_git_root = function()
	---@type string|nil
	local root_dir = nil

	for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
		if vim.fn.isdirectory(dir .. "/.git") == 1 then
			root_dir = dir
			break
		end
	end

	return root_dir
end

return Utils
