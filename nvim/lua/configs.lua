vim.filetype.add({
	pattern = {
		[".*docker%-compose%.ya?ml"] = "dockercompose",
	},
})
vim.treesitter.language.register("yaml", "dockercompose")
