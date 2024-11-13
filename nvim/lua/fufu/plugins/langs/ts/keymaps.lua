-- vim.keymap.set("n", "<leader>cia", function()
-- 	vim.lsp.buf.code_action({
-- 		apply = true,
-- 		context = { only = { "source.addMissingImports.ts" } },
-- 	})
-- end, { desc = "[i]mport [a]ll missing typescript" })

-- ts helpers
vim.keymap.set("n", "<leader>cia", ":TSToolsAddMissingImports<CR>", { desc = "[TS] - [c]ode aciton - [i]mport [a]ll" })
-- vim.keymap.set("n", "<leader>c", ":silent! EslintFixAll<CR>", { desc = "[TS] - fix all esling errors" })
return {}
