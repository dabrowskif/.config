return {
	"mbbill/undotree",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>tu", vim.cmd.UndotreeToggle, { desc = "[T]oggle [U]ndo tree" })
	end,
}
