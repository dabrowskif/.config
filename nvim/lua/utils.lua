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

return Utils
