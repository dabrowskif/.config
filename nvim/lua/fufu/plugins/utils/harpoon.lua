return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon - [A]dd file" })
		vim.keymap.set("n", "<leader>th", ui.toggle_quick_menu, { desc = "[T]oggle [H]arpoon" })

		for i = 1, 5 do
			vim.keymap.set("n", "<leader>" .. i, function()
				ui.nav_file(i)
			end, { desc = "Harpoon - " .. i .. "file" })
		end

		require("harpoon").setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 20,
			},
		})
	end,
}
