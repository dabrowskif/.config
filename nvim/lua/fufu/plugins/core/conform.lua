return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })

				local filetype = vim.bo.filetype
				if filetype == "javascript" or filetype == "typescript" then
					vim.cmd("silent! EslintFixAll")
				end
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	config = function()
		require("conform").setup({
			notify_on_error = true,
			format_on_save = function()
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
			},
		})
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	group = vim.api.nvim_create_augroup("EslintFixAll", { clear = true }),
		-- 	pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", ".svelte", ".astro" },
		-- 	command = "silent! EslintFixAll",
		-- })
	end,
}
