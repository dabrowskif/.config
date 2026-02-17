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

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.svelte" },
-- 	callback = function(event)
-- 		print("ARST")
-- local params = vim.lsp.util.make_range_params(0, "utf-8")
-- params.context = { diagnostics = vim.diagnostic.get(0) }
-- vim.lsp.buf_request_all(0, "textDocument/codeAction", params, function(results, context, config)
-- 	print("xd")
-- end)
-- local is_biome_attached = vim.lsp.get_clients({ name = "biome" })
--
-- print(vim.inspect(is_biome_attached[1].capabilities))
-- print(vim.inspect(is_biome_attached))
-- if is_biome_attached then
-- 	vim.fn.jobstart({ "biome", "check", "--write", event.file }, {
-- 		on_exit = function()
-- 			vim.cmd("edit")
-- 		end,
-- 	})
-- end
-- 	end,
-- })

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

-- Allows Ctrl + kj to move commits inside lazygit.
-- Without this i get "fish: unknown command TmuxNavigateDown" errors
-- vim.api.nvim_create_autocmd("TermOpen", {
-- 	callback = function()
-- 		vim.cmd([[
--       tnoremap <silent> <C-h> <C-h>
--       tnoremap <silent> <C-j> <C-j>
--       tnoremap <silent> <C-k> <C-k>
--       tnoremap <silent> <C-l> <C-l>
--     ]])
-- 	end,
-- })
