vim.keymap.set("n", "<leader>cia", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = { only = { "source.addMissingImports.ts" } },
	})
end, { desc = "[i]mport [a]ll missing typescript" })

return {}
