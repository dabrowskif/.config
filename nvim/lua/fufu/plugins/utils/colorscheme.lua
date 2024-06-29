return {
	"folke/tokyonight.nvim",
	-- 'ellisonleao/gruvbox.nvim',
	-- 'craftzdog/solarized-osaka.nvim',
	priority = 1000,
	lazy = false,
	init = function()
		-- setup for tokyonight
		vim.cmd.colorscheme("tokyonight-moon") -- 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.cmd.hi("Comment gui=none") -- configure highlights

		-- setup for gruvbox
		--     vim.cmd.colorscheme 'gruvbox'
		--     vim.o.background = 'dark'

		-- setup fow solarized-osaka
		-- 		require('solarized-osaka').setup {
		-- 			styles = {
		-- 				functions = {},
		-- 				sidebars = 'transparent',
		-- 			},
		-- 			transparent = true,
		-- 			on_colors = function(colors)
		-- 				colors.hint = colors.orange
		-- 				colors.error = '#ff0000'
		-- 			end,
		-- 			on_highlights = function(hl, c)
		-- 				local prompt = '#2d3149'
		-- 				hl.TelescopeNormal = {
		-- 					bg = c.bg_dark,
		-- 					fg = c.fg_dark,
		-- 				}
		-- 				hl.TelescopeBorder = {
		-- 					bg = c.bg_dark,
		-- 					fg = c.bg_dark,
		-- 				}
		-- 				hl.TelescopePreviewTitle = {
		-- 					bg = c.bg_dark,
		-- 					fg = c.bg_dark,
		-- 				}
		-- 				hl.TelescopeResultsTitle = {
		-- 					bg = c.bg_dark,
		-- 					fg = c.bg_dark,
		-- 				}
		-- 			end,
		-- 		}
		-- 		require('solarized-osaka').load()
	end,
}
