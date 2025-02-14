return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
				--
				-- local filetype = vim.bo.filetype
				-- local eslintFixableFiletypes = { "javascript", "typescript", "svelte", "astro" }
				-- print(filetype)
				-- print(eslintFixableFiletypes[filetype])
				-- if eslintFixableFiletypes[filetype] ~= nil then
				-- 	vim.cmd("silent! EslintFixAll")
				-- end
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
	end,
}
