-- eslint
vim.pack.add({ { src = "https://github.com/esmuellert/nvim-eslint", name = "nvim-eslint" } })
require("nvim-eslint").setup({})

-- typescript
vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" } })
vim.pack.add({ { src = "https://github.com/pmizio/typescript-tools.nvim", name = "typescript-tools" } })
vim.keymap.set("n", "<leader>fr", ":LspRestart<CR>", { desc = "Restart LSP", silent = true })
vim.keymap.set("n", "<leader>fi", ":TSToolsAddMissingImports", { desc = "[g]o [d]efinition" })
require("typescript-tools").setup({})

-- vim.lsp.config["ts_ls"] = {
-- 	cmd = { "typescript-language-server", "--stdio" },
-- }
-- vim.lsp.enable("ts_ls")
