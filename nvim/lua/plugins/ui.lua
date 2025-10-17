-- Colorscheme
vim.pack.add({ { src = "https://github.com/folke/tokyonight.nvim", name = "tokyonight" } })
vim.cmd.colorscheme("tokyonight-night")
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "orange" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "orange" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "orange" })

-- Lualine
vim.pack.add({ { src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine" } })
require("lualine").setup({})

-- Noice - for better input, docs etc.
vim.pack.add({ { src = "https://github.com/MunifTanjim/nui.nvim", name = "nui" } }) -- dependency
vim.pack.add({ { src = "https://github.com/folke/noice.nvim", name = "noice" } })
require("noice").setup({})
