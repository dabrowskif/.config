vim.api.nvim_create_user_command("BiomeFix", function()
	local file = vim.api.nvim_buf_get_name(0)
	if file ~= "" then
		vim.fn.jobstart({ "biome", "check", "--write", file }, {
			on_exit = function()
				vim.cmd("edit")
			end,
		})
	end
end, {})
