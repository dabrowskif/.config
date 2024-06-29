return {
	"stevearc/oil.nvim",
	opts = {
		lsp_file_methods = {
			timeout_ms = 10000,
			autosave_changes = true,
		},
		default_file_explorer = false,
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "<leader>to", require("oil").toggle_float, { desc = "[T]oggle [O]il" })
	end,
}
