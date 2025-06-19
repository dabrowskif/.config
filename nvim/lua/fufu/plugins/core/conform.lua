local Utils = require("fufu.utils")

local function get_js_formatters()
	local clients = Utils.get_active_lsp_clients()

	if clients.biome then
		return { "biome" }
	elseif clients.eslint then
		return { "prettier" }
		-- return { "prettierd" }
	else
		return { "prettierd" }
		-- return { "biome" }
	end
end

local function format_after_save()
	local clients = Utils.get_active_lsp_clients()

	-- @FIXME: this takes couple hundreds of milliseconds and is not suitable to use before biome/eslint (unless a proper way of handling this is found, like await/schedule/vim.defer_fn, but nothing seems to work properly...)
	-- if clients["typescript-tools"] then
	-- 	vim.cmd("TSToolsRemoveUnusedImports")
	-- end

	if clients.biome then
		-- @FIXME: there should be a simple way of doing this...
		local current_file = vim.fn.expand("%:p")
		vim.fn.system("biome check --apply " .. vim.fn.shellescape(current_file))
		vim.cmd("checktime")
	end

	if clients.eslint then
		vim.cmd("silent! EslintFixAll")
	end
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = {
		async = true,
		notify_on_error = true,
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		format_after_save = format_after_save,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = get_js_formatters,
			typescript = get_js_formatters,
		},
	},
}
