-- return {
--   -- Theme inspired by Atom
--   'navarasu/onedark.nvim',
--   priority = 1000,
--   lazy = false,
--   config = function()
--     require('onedark').setup {
--       -- Set a style preset. 'dark' is default.
--       style = 'deep', -- dark, darker, cool, deep, warm, warmer, light
--       transparent = true,
--     }
--     require('onedark').load()
--   end,
-- }
--
-- solarized osaka
return {
  'craftzdog/solarized-osaka.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('solarized-osaka').setup {
      styles = {
        -- sidebars = 'transparent',
      },
      transparent = true,
    }
    require('solarized-osaka').load()
  end,
}
