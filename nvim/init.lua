-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require("options")
require("plugins")
require("lsp")
require("configs")

vim.filetype.add({
	pattern = {
		["*docker-compose.yml"] = "dockercompose",
		["*docker-compose.yaml"] = "dockercompose",
		["docker-compose.yml"] = "dockercompose",
		["docker-compose.yaml"] = "dockercompose",
	},
})

require("autocmds")
require("keymaps") -- last since using plugins to set up multiple keywords
