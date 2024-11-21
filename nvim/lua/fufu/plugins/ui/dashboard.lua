return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = {

					"_______________ __________________ ___  ________  _______________   ____",
					"\\_   _____/    |   \\_   _____/    |   \\ \\______ \\ \\_   _____/\\   \\ /   /",
					" |    __) |    |   /|    __) |    |   /  |    |  \\ |    __)_  \\   Y   / ",
					" |     \\  |    |  / |     \\  |    |  /   |    `   \\|        \\  \\     /  ",
					" \\___  /  |______/  \\___  /  |______/   /_______  /_______  /   \\___/   ",
					"     \\/                 \\/                      \\/        \\/            ",
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
