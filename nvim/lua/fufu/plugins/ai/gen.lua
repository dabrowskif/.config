return {
	"David-Kunz/gen.nvim",
	opts = {
		model = "llama3.1",
		display_mode = "split",
	},
	config = function(_, opts)
		require("gen").setup(opts)
		vim.keymap.set({ "n", "v" }, "<leader>]", ":Gen<CR>")
	end,
}
