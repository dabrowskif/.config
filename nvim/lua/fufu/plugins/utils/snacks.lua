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
			{
				"<leader>ts",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>tz",
				function()
					Snacks.zed()
				end,
				desc = "Toggle Scratch Buffer",
			},
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
}
