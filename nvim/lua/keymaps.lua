-- Coding
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move lines block up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move lines block down" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [d]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [d]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror messages" })

-- Utils
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { silent = true, desc = "Clear search" })
vim.keymap.set("n", "x", '"_x', { silent = true, desc = "Delete omiting the register" })

-- Shortcuts
vim.keymap.set("n", "<leader>p", ':lua vim.print(require("', { desc = "[p]eek plugin" })
vim.keymap.set("n", "<leader>R", ":restart<CR>", { desc = "[R]estart nvim" })

-- LSP
vim.keymap.set("n", "gd", Snacks.picker.lsp_definitions, { desc = "[g]o [d]efinition" })
vim.keymap.set("n", "gD", Snacks.picker.lsp_declarations, { desc = "[g]o [D]eclaration" })
vim.keymap.set("n", "gt", Snacks.picker.lsp_type_definitions, { desc = "[g]o [t]ype" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

-- LSP - TypeScript
vim.keymap.set("n", "<leader>fr", ":LspRestart<CR>", { desc = "Restart LSP", silent = true })
vim.keymap.set("n", "<leader>fi", ":TSToolsAddMissingImports<CR>", { desc = "[g]o [d]efinition" })

-- Navigation
vim.keymap.set("n", "<leader>to", require("oil").toggle_float)
vim.keymap.set("n", "<leader>sf", Snacks.picker.files, { desc = "[s]earch [f]iles" })
vim.keymap.set("n", "<leader>sw", Snacks.picker.grep_word, { desc = "[s]erach [w]ord" })
vim.keymap.set("n", "<leader>sg", Snacks.picker.grep, { desc = "[s]earch [g]rep" })
vim.keymap.set("n", "<leader>sk", Snacks.picker.keymaps, { desc = "[s]earch [k]eymaps" })
vim.keymap.set("n", "<leader>sr", Snacks.picker.resume, { desc = "[s]earch [r]ecent" })

local harpoon = require("harpoon")
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

-- Other
vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazy [G]it" })
vim.keymap.set("n", "<leader>sn", Snacks.notifier.show_history, { desc = "[s]earch [n]notifications" })
vim.keymap.set("n", "<leader>cc", ":CodeCompanionActions<CR>", { desc = "[C]ode [C]ompanion Actions" })
