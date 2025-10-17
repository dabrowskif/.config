-- Treesitter - file AST & highlighting
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter" } })
-- vim.schedule(function()
-- 	vim.cmd.TSUpdate()
-- end)

-- Blink - autocomplete
vim.pack.add({ { src = "https://github.com/Saghen/blink.cmp", name = "blink", version = vim.version.range("1.7") } })
local blink = require("blink.cmp")
blink.setup({
	keymap = {
		preset = "none",
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-f>"] = { "scroll_documentation_up" },
		["<C-b>"] = { "scroll_documentation_down" },
		["<C-e>"] = { "accept" },
		["<C-Space>"] = { "show" },
	},
})

-- Mini.pairs - autopairs
require("mini.pairs").setup()

-- Conform - formatter
vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim", name = "conform" } })
require("conform").setup({
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", "biome", stop_after_first = true },
		typescript = { "prettierd", "prettier", "biome", stop_after_first = true },
		svelte = { "prettierd", "prettier", "biome", stop_after_first = true },
	},
})
