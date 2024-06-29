return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = function(bufnr)
			return {
				timeout_ms = 3000,
				lsp_fallback = true,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			markdown = { "markdownlint" },
			terraform = { "tflint" },
			json = { "jsonlint" },
			dockerfile = { "hadolint" },
			javascript = { "prettierd", "eslint_d" },
			typescript = { "prettierd", "eslint_d" },
			svelte = { "prettierd", "eslint_d" },
			go = { "golines", "goimports", "golangci", "golangci_lint_ls", "golangci-lint" },
			html = { "htmlbeautifier", "htmlhint" },
			tmpl = { "htmlbeautifier", "htmlhint" },
		},
	},
	-- config = function()
	-- vim.api.nvim_create_autocmd('BufWritePre', {
	--   group = vim.api.nvim_create_augroup('EslintFixAll', { clear = true }),
	--   pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
	--   command = 'silent! EslintFixAll',
	-- })
	-- end,
}
