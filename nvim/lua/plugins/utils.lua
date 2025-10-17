-- Which-key
vim.pack.add({ { src = "https://github.com/folke/which-key.nvim", name = "which-key" } })

-- LazyGit
-- (Snacks initialized in plugins.deps)
vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazy [G]it" })

-- Lazydev - for nvim plugins autocompletion/intellisense
vim.pack.add({ { src = "https://github.com/folke/lazydev.nvim", name = "lazydev" } })
require("lazydev").setup()

-- Mason - for adding lsp etc.
vim.pack.add({ { src = "https://github.com/mason-org/mason.nvim", name = "mason" } })
require("mason").setup({})

-- Notification history
vim.keymap.set("n", "<leader>sn", Snacks.notifier.show_history, { desc = "[s]earch [n]notifications" })

-- Highlighting text
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

-- Higlight other uses of wordunder cursor
vim.pack.add({ { src = "https://github.com/RRethy/vim-illuminate", name = "vim-illuminate" } })
