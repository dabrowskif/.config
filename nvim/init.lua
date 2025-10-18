-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require("options")
require("plugins")
require("configs")
require("lsp")
require("setups")

require("keymaps") -- last since using plugins to set up multiple keywords
