-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require("options")
require("plugins.deps") -- has to be first

require("lsp.lua")
require("lsp.ts")

require("plugins.ui")
require("plugins.coding")
require("plugins.utils")
require("plugins.navigation")
require("plugins.ai")

require("keymaps") -- last since using plugins to set up multiple keywords
