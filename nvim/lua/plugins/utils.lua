-- Which Key - keymaps helper
vim.pack.add({ { src = "https://github.com/folke/which-key.nvim", name = "which-key" } })

-- Lazydev - nvim plugins intellisense
vim.pack.add({ { src = "https://github.com/folke/lazydev.nvim", name = "lazydev" } })
require("lazydev").setup()

-- Mason - automatic LSP installation
vim.pack.add({ { src = "https://github.com/mason-org/mason.nvim", name = "mason" } })
require("mason").setup({})

-- Mini.hipatterns - hightlight text
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

-- Vim-illuminate - higlight other uses of word under cursor
vim.pack.add({ { src = "https://github.com/RRethy/vim-illuminate", name = "vim-illuminate" } })
