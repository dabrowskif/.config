-- must be before everything
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("fufu.keymaps")
require("fufu.autocmds")
require("fufu.options")

local spec = {
	{ import = "fufu.plugins.core" },
	{ import = "fufu.plugins.git" },
	{ import = "fufu.plugins.ui" },
	{ import = "fufu.plugins.debugger" },
	{ import = "fufu.plugins.utils" },
	-- { import = "fufu.plugins.langs.go" },
	{ import = "fufu.plugins.langs.ts" },
}

require("lazy").setup({ spec })
