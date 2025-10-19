local Configs = require("configs")

-- TODO: setup this on startup
-- "uv tool upgrade vectorcode"
--
-- TODO: setup this on startup
-- vim.schedule(function()
-- 	vim.cmd.TSUpdate()
-- end)

vim.cmd.colorscheme("tokyonight-night")
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "orange" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "orange" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "orange" })

require("snacks").setup(Configs.snacks)
require("codecompanion").setup(Configs.codeCompanion)
require("conform").setup(Configs.conform)
require("harpoon"):setup()
require("oil").setup(Configs.oil)
require("lualine").setup({})
require("noice").setup()
require("lazydev").setup()
require("mason").setup()
require("mini.hipatterns").setup(Configs.hipatterns)
require("mini.cursorword").setup()
require("mini.pairs").setup()
require("nvim-treesitter.configs").setup(Configs.nvim_treesitter)
require("blink.cmp").setup(Configs.blink)
require("perch").setup(Configs.perch)
