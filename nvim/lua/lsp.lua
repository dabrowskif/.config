vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, _)
	return vim.NIL
end

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
-- vim.pack.add({ { src = "https://github.com/esmuellert/nvim-eslint", name = "nvim-eslint" } })
-- require("nvim-eslint").setup({})

-- typescript
vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" } })
vim.pack.add({ { src = "https://github.com/pmizio/typescript-tools.nvim", name = "typescript-tools" } })
require("typescript-tools").setup({
	filetypes = { "svelte", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	settings = {
		expose_as_code_action = "all",
		-- tsserver_format_options = function()
		-- 	return {
		-- 		allowIncompleteCompletions = false,
		-- 		allowRenameOfImportPath = false,
		-- 	}
		-- end,
	},
})

-- native typescript, disabled
-- vim.lsp.config["ts_ls"] = {
-- 	filetypes = { "typescript", "javascript" },
-- 	cmd = { "typescript-language-server", "--stdio" },
-- }
-- vim.lsp.enable("ts_ls")

vim.lsp.config["docker_ls"] = {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
}
vim.lsp.enable("docker_ls")

vim.lsp.config["tf_ls"] = {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "terraform-state", "tf", "terraform-vars" },
	settings = {},
}
vim.lsp.enable("tf_ls")

vim.lsp.config["dockercompose_ls"] = {
	cmd = { "docker-compose-langserver", "--stdio" },
	filetypes = { "dockercompose" },
}
vim.lsp.enable("dockercompose_ls")

vim.lsp.config["svelte_ls"] = {
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
	root_markers = { { "svelte.config.js" }, ".git" },
}
vim.lsp.enable("svelte_ls")

vim.lsp.config["python_ls"] = {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	oot_markers = { "requirements.txt" },
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
}
vim.lsp.enable("python_ls")

vim.lsp.config["go_ls"] = {
	cmd = { "gopls" },
	filetypes = { "go" },
}
vim.lsp.enable("go_ls")

vim.lsp.config["json_ls"] = {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json" },
}
vim.lsp.enable("json_ls")
