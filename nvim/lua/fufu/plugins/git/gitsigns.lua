return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},

		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "<leader>ghd", gitsigns.diffthis, { desc = "git [d]iff against index" })
			map("n", "<leader>ghD", function()
				gitsigns.diffthis("@")
			end, { desc = "git [D]iff against last commit" })

			map("n", "<leader>ghb", gitsigns.blame_line, { desc = "git [b]lame line" })
			map("n", "<leader>tgb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
			map("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[T]oggle git show [D]eleted" })
		end,
	},
}
