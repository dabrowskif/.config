-- Lua
vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
				disable = { "missing-fields" },
			},
			runtime = {
				version = "LuaJIT",
			},
		},
	},
}
vim.lsp.enable("lua_ls")

-- eslint
vim.pack.add({ { src = "https://github.com/esmuellert/nvim-eslint", name = "nvim-eslint" } })
require("nvim-eslint").setup({})

-- typescript
vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" } })
vim.pack.add({ { src = "https://github.com/pmizio/typescript-tools.nvim", name = "typescript-tools" } })
require("typescript-tools").setup({})

-- native typescript, disabled
-- vim.lsp.config["ts_ls"] = {
-- 	cmd = { "typescript-language-server", "--stdio" },
-- }
-- vim.lsp.enable("ts_ls")
