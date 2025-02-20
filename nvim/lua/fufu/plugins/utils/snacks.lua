-- lazy.nvim
return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		-- bigfile = {},
		-- scratch = {},
		dashboard = {
			preset = {
				header = [[
███████╗██╗   ██╗███████╗██╗   ██╗██████╗ ███████╗██╗   ██╗
██╔════╝██║   ██║██╔════╝██║   ██║██╔══██╗██╔════╝██║   ██║
█████╗  ██║   ██║█████╗  ██║   ██║██║  ██║█████╗  ██║   ██║
██╔══╝  ██║   ██║██╔══╝  ██║   ██║██║  ██║██╔══╝  ╚██╗ ██╔╝
██║     ╚██████╔╝██║     ╚██████╔╝██████╔╝███████╗ ╚████╔╝ 
╚═╝      ╚═════╝ ╚═╝      ╚═════╝ ╚═════╝ ╚══════╝  ╚═══╝  
				]],
			},
		},
		-- zen = {},
		input = {},
		notifier = {},
		-- scope = {},
		-- statuscolumn = {},
		-- indent = {},
		keys = {
			-- {
			-- 	"<leader>tnh",
			-- 	function()
			-- 		Snacks.notifier.show_history()
			-- 	end,
			-- 	desc = "[T]oggle [N]otifier [H]istory",
			-- },

			-- {
			--
			-- 	"<leader>>",
			-- 	function()
			-- 		Snacks.scratch.select()
			-- 	end,
			-- 	desc = "Select Scratch Buffer",
			-- },
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)
		vim.keymap.set("n", "<leader>tnh", Snacks.notifier.show_history, { desc = "[T]oggle [N]otifier [H]istory" })
	end,
}
