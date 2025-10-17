-- Harpoon
vim.pack.add({ { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2", name = "harpoon" } })
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "[a]dd to harpoon list" })

vim.keymap.set("n", "<leader>th", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[t]oggle harpoon list" })
for i = 1, 5 do
	vim.keymap.set("n", "<leader>" .. i, function()
		harpoon:list():select(i)
	end, { desc = "Open [" .. i .. "] harpoon file" })
end

-- Oil
vim.pack.add({ { src = "https://github.com/stevearc/oil.nvim", name = "oil" } })
local oil = require("oil")
oil.setup({
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = true,
	float = {
		max_width = 0.5,
		max_height = 0.5,
		border = "rounded",
	},
	lsp_file_methods = {
		enabled = true,
		autosave_changes = "unmodified",
	},
})
vim.keymap.set("n", "<leader>to", oil.toggle_float)

-- Vim Tmux Navigator
vim.pack.add({ { src = "https://github.com/christoomey/vim-tmux-navigator", name = "vim-tmux-navigator" } })

-- File finder
-- (Snacks initialized in plugins.deps)
vim.keymap.set("n", "<leader>sf", Snacks.picker.files, { desc = "[s]earch [f]iles" })
vim.keymap.set("n", "<leader>sw", Snacks.picker.grep_word, { desc = "[s]erach [w]ord" })
vim.keymap.set("n", "<leader>sg", Snacks.picker.grep, { desc = "[s]earch [g]rep" })
vim.keymap.set("n", "<leader>sk", Snacks.picker.keymaps, { desc = "[s]earch [k]eymaps" })
vim.keymap.set("n", "<leader>sr", Snacks.picker.resume, { desc = "[s]earch [r]ecent" })
