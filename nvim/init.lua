-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require("plugins.deps") -- has to be first

require("keymaps")
require("options")

require("lsp.lua")
require("lsp.ts")

require("plugins.ui")
require("plugins.coding")
require("plugins.utils")
require("plugins.navigation")
