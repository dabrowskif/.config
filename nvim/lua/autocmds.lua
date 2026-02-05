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

-- use later after switching to new treesitter
---@type TSConfig
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = require("plugins-configs").nvim_treesitter_langs,
-- 	callback = function()
-- 		-- syntax highlighting, provided by Neovim
-- 		vim.treesitter.start()
-- 		-- folds, provided by Neovim
-- 		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 		-- vim.wo.foldmethod = "expr"
-- 		-- indentation, provided by nvim-treesitter
-- 		-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 	end,
-- })
