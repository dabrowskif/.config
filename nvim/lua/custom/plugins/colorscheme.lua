return { 
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-moon'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
}
--
--   -- {
--   --   'ellisonleao/gruvbox.nvim',
--   --   priority = 1000,
--   --   init = function()
--   --     vim.cmd.colorscheme 'gruvbox'
--   --     vim.o.background = 'dark'
--   --   end,
--   -- },
-- return {
-- 	'craftzdog/solarized-osaka.nvim',
-- 	priority = 1000,
-- 	lazy = false,
-- 	config = function()
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
-- 	end,
-- }
