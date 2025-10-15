return {
	-- "navarasu/onedark.nvim",
	"folke/tokyonight.nvim",
	-- "ellisonleao/gruvbox.nvim",
	-- "craftzdog/solarized-osaka.nvim",
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	priority = 1000,
	lazy = false,
	init = function()
		-- require("onedark").setup({
		-- 	style = "deep",
		-- 	highlights = {
		-- 		["LineNr"] = { fg = "$orange" },
		-- 		["CursorLineNr"] = { fg = "$blue" },
		-- 	},
		-- })
		-- require("onedark").load()

		-- setup for tokyonight
		vim.cmd.colorscheme("tokyonight-night") -- 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "orange" })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "orange" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "orange" })
		-- vim.cmd.hi("Comment gui=none") -- configure highlights

		-- setup for gruvbox
		-- vim.cmd.colorscheme("gruvbox")
		-- vim.o.background = "dark"

		-- setup for solarized-osaka
		-- require("solarized-osaka").setup({
		-- 	styles = {
		-- 		functions = {},
		-- 		sidebars = "transparent",
		-- 	},
		-- 	transparent = true,
		-- 	on_colors = function(colors)
		-- 		colors.hint = colors.orange
		-- 		colors.error = "#ff0000"
		-- 	end,
		-- 	on_highlights = function(hl, c)
		-- 		local prompt = "#2d3149"
		-- 		hl.TelescopeNormal = {
		-- 			bg = c.bg_dark,
		-- 			fg = c.fg_dark,
		-- 		}
		-- 		hl.TelescopeBorder = {
		-- 			bg = c.bg_dark,
		-- 			fg = c.bg_dark,
		-- 		}
		-- 		hl.TelescopePreviewTitle = {
		-- 			bg = c.bg_dark,
		-- 			fg = c.bg_dark,
		-- 		}
		-- 		hl.TelescopeResultsTitle = {
		-- 			bg = c.bg_dark,
		-- 			fg = c.bg_dark,
		-- 		}
		-- 	end,
		-- })
		-- require("solarized-osaka").load()

		-- catppuccin
		-- require("catppuccin").setup({
		-- 	flavour = "mocha", -- latte, frappe, macchiato, mocha
		-- })
		-- vim.cmd.colorscheme("catppuccin")
	end,
}
