return {
	"stevearc/oil.nvim",
	lazy = true,
	opts = {
		lsp_file_methods = {
			timeout_ms = 10000,
			autosave_changes = true,
		},
		default_file_explorer = true,
		watch_for_changes = false,
		keymaps = {
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
	keys = {
		{
			"<leader>to",
			function()
				require("oil").toggle_float()
			end,
			desc = "[T]oggle [O]il",
		},
	},
}
