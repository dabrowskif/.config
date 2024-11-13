-- INFO: [[ Basic Autocommands ]]
-- See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = vim.api.nvim_create_augroup("EslintFixAll", { clear = true }),
-- 	pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
-- 	command = "silent! EslintFixAll",
-- })
