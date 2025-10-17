-- Plenary
vim.pack.add({ { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" } })

-- Snacks
vim.pack.add({ { src = "https://github.com/folke/snacks.nvim", name = "snacks" } })
require("snacks").setup({
	notifier = {},
	picker = {
		win = {
			input = {
				keys = {
					["<C-e>"] = { "confirm", mode = { "n", "i" } },
				},
			},
		},
	},
	zen = {},
})

-- Mini
vim.pack.add({ { src = "https://github.com/nvim-mini/mini.nvim", name = "mini" } })
