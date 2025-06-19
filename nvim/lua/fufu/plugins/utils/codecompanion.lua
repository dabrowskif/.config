return {
	"olimorris/codecompanion.nvim",
	keys = {
		{ "<leader>cc", "<cmd>CodeCompanionActions<CR>", desc = "[C]ode [C]ompanion Actions" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keymaps = {},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
				cmd = {
					adapter = "anthropic",
				},
			},
			adapters = {
				anthropic = function()
					return require("codecompanion.adapters").extend("anthropic", {
						env = {
							-- INFO: Adjust the path if needed
							api_key = "cmd:~/.config/nvim/scripts/extract-env.sh ANTHROPIC_KEY ~/.config/nvim/.env",
						},
					})
				end,
			},
		})
	end,
}
