-- Harpoon - fast recent navigation
vim.pack.add({ { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2", name = "harpoon" } })
require("harpoon"):setup()

-- Oil - file tree
vim.pack.add({ { src = "https://github.com/stevearc/oil.nvim", name = "oil" } })
require("oil").setup({
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

-- Vim Tmux Navigator - moving between tmux panes to and from nvim
vim.pack.add({ { src = "https://github.com/christoomey/vim-tmux-navigator", name = "vim-tmux-navigator" } })
