return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backdrop = 1,
			width = 0.5,
		},
	},
	config = function(_, opts)
		vim.keymap.set("n", "<leader>tz", ":ZenMode<CR>", { desc = "[T]oggle ZenMode" })

		require("zen-mode").setup(opts)
	end,
}
