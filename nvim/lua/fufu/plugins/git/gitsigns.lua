return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
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

			-- Ensure we only attach if the file is inside a Git repository
			-- if not gitsigns.status_dict then
			-- 	return
			-- end

			vim.keymap.set("n", "<leader>ghd", gitsigns.diffthis, { buffer = bufnr, desc = "git [d]iff against index" })
			vim.keymap.set("n", "<leader>ghD", function()
				gitsigns.diffthis("@")
			end, { buffer = bufnr, desc = "git [D]iff against last commit" })
			vim.keymap.set("n", "<leader>ghb", gitsigns.blame_line, { buffer = bufnr, desc = "git [b]lame line" })
			vim.keymap.set(
				"n",
				"<leader>tgb",
				gitsigns.toggle_current_line_blame,
				{ buffer = bufnr, desc = "[T]oggle git show [b]lame line" }
			)
			vim.keymap.set(
				"n",
				"<leader>tD",
				gitsigns.preview_hunk_inline,
				{ buffer = bufnr, desc = "[T]oggle git show [D]eleted" }
			)
		end,
	},
}
