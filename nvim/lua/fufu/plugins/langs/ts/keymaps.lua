vim.keymap.set("n", "<leader>cia", ":TSToolsAddMissingImports<CR>", { desc = "[TS] - [c]ode aciton - [i]mport [a]ll" })
vim.keymap.set("n", "<leader>cfa", ":silent! EslintFixAll<CR>", { desc = "[TS] - fix all esling errors" })
return {}
