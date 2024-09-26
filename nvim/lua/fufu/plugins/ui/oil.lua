return {
	"stevearc/oil.nvim",
	opts = {
		lsp_file_methods = {
			timeout_ms = 10000,
			autosave_changes = true,
		},
		default_file_explorer = false,
		watch_for_changes = false,
		keymaps = {
			["T"] = "actions.parent",
			["t"] = "actions.select",
			["<leader>ogr"] = {
				"actions.open_cwd",
				desc = "[o]il [g]oto [c]wd",
			},
			["<leader>oth"] = {
				"actions.toggle_hidden",
				desc = "[o]il [t]oggle [h]idden",
			},
			["<C-r>"] = "actions.refresh",
		},
		skip_confirm_for_simple_edits = true,
		use_default_keymaps = true,
		float = {
			max_width = 100,
			max_height = 25,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "<leader>to", require("oil").toggle_float, { desc = "[T]oggle [O]il" })
	end,
}
