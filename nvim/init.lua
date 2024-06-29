-- WARN: Must be before everything
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Install lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	-- stylua: ignore
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Init vim spec
require("fufu.keymaps")
require("fufu.autocmds")
require("fufu.options")

-- Init lazy
require("lazy").setup({
	spec = {
		{ import = "fufu.plugins.coding" },
		{ import = "fufu.plugins.git" },
		{ import = "fufu.plugins.langs.go" },
		{ import = "fufu.plugins.langs.ts" },
		{ import = "fufu.plugins.lsp" },
		{ import = "fufu.plugins.ui" },
		{ import = "fufu.plugins.utils" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	checker = {
		enabled = true,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
