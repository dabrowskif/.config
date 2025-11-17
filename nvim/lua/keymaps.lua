-- Coding
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move lines block up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move lines block down" })

vim.keymap.set("n", "<A-Right>", ":vertical resize -5<CR>", { silent = true, desc = "Resize Right" })
vim.keymap.set("n", "<A-Left>", ":vertical resize +5<CR>", { silent = true, desc = "Resize Left" })
vim.keymap.set("n", "<A-Down>", ":resize +3<CR>", { silent = true, desc = "Resize Down" })
vim.keymap.set("n", "<A-Up>", ":resize -3<CR>", { silent = true, desc = "Resize Up" })

-- Diagnostics
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ severity = 1 })
end, { desc = "Go to previous diagnostic error" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ severity = 1 })
end, { desc = "Go to next diagnostic error" })

-- Utils
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { silent = true, desc = "Clear search" })
vim.keymap.set("n", "x", '"_x', { silent = true, desc = "Delete omiting the register" })

-- Shortcuts
vim.keymap.set("n", "<leader>pr", ':lua vim.print(require("', { desc = "Peek plugin" })
vim.keymap.set("n", "<leader>R", ":restart<CR>", { desc = "Restart nvim" })

-- Updates
vim.keymap.set("n", "<leader>vu", vim.pack.update, { desc = "Update packages" })

-- LSP
vim.keymap.set("n", "gd", Snacks.picker.lsp_definitions, { desc = "Go definition" })
vim.keymap.set("n", "gD", Snacks.picker.lsp_declarations, { desc = "Go declaration" })
vim.keymap.set("n", "gt", Snacks.picker.lsp_type_definitions, { desc = "Go type" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- LSP - TypeScript
vim.keymap.set("n", "<leader>fr", ":LspRestart<CR>", { desc = "Restart LSP", silent = true })
vim.keymap.set("n", "<leader>fi", ":TSToolsAddMissingImports<CR>", { desc = "Format imports", silent = true })

-- Navigation
vim.keymap.set("n", "<leader>to", require("oil").toggle_float, { desc = "Toggle oil" })
vim.keymap.set("n", "<leader>te", ":Neotree<CR>", { desc = "Toggle neo tree" })
vim.keymap.set("n", "<leader>sf", Snacks.picker.files, { desc = "Search files" })
vim.keymap.set("n", "<leader>shf", function()
	Snacks.picker.files(
		---@type snacks.picker.files.Config
		{
			hidden = true,
		}
	)
end, { desc = "Search hidden files" })
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump({})
end, { desc = "Flash" })

vim.keymap.set("n", "<leader>shg", function()
	Snacks.picker.grep(
		---@type snacks.picker.grep.Config
		{
			hidden = true,
		}
	)
end, { desc = "Search hidden ggrep" })
vim.keymap.set("n", "<leader>sw", Snacks.picker.grep_word, { desc = "Search word" })
vim.keymap.set("n", "<leader>sg", Snacks.picker.grep, { desc = "Search grep" })
vim.keymap.set("n", "<leader>sb", Snacks.picker.lines, { desc = "Search buffer" })
vim.keymap.set("n", "<leader>sk", Snacks.picker.keymaps, { desc = "Search keymaps" })
vim.keymap.set("n", "<leader>sr", Snacks.picker.resume, { desc = "Search recent" })
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Add to harpoon list" })
vim.keymap.set("n", "<leader>th", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle harpoon list" })
for i = 1, 5 do
	vim.keymap.set("n", "<leader>" .. i, function()
		harpoon:list():select(i)
	end, { desc = "Open " .. i .. " harpoon file" })
end

-- Other
vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazy git" })
vim.keymap.set("n", "<leader>ldo", function()
	require("Lazydocker").open()
end, { desc = "Lazy docker" })
vim.keymap.set("n", "<leader>lds", require("utils").start_colima, { desc = "Start dockerd" })
vim.keymap.set("n", "<leader>go", function()
	Snacks.gitbrowse()
end, { desc = "Open file in git" })
vim.keymap.set("n", "<leader>tn", Snacks.notifier.show_history, { desc = "Toggle notifications" })
vim.keymap.set("n", "<leader>cc", ":CodeCompanionActions<CR>", { desc = "Code companion actions" })

-- Debugger
vim.keymap.set("n", "<leader>dt", require("dapui").toggle, { desc = "[D]ebugger: toggle" })
vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "[D]ebugger: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "[D]ebugger: Set Breakpoint" })
