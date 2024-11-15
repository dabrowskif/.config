return {
	"stevearc/oil.nvim",
	opts = {
		lsp_file_methods = {
			timeout_ms = 10000,
			autosave_changes = true,
		},
		default_file_explorer = true,
		watch_for_changes = false,
		keymaps = {
			-- ["T"] = "actions.parent",
			-- ["t"] = "actions.select",
			["<leader>or"] = {
				"actions.open_cwd",
				desc = "[o]il goto project [r]oot",
			},
			["<leader>oh"] = {
				"actions.toggle_hidden",
				desc = "[o]il toggle [h]idden",
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
