vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		-- print(vim.inspect(event.data.actions))
		-- TSToolsRenameFile
		if event.data.actions and event.data.actions[1] and event.data.actions[1].type == "move" then
			Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
		end
	end,
})
