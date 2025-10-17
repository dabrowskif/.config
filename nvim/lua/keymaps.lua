-- coding
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move lines block up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move lines block down" })

-- diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [d]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [d]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror messages" })

-- utils
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { silent = true, desc = "Clear search" })
vim.keymap.set("n", "x", '"_x', { silent = true, desc = "Delete omiting the register" })

-- shortcuts
vim.keymap.set("n", "<leader>p", ':lua vim.print(require("', { desc = "[p]eek plugin" })
vim.keymap.set("n", "<leader>R", ":restart<CR>", { desc = "[R]estart nvim" })

-- LSP
vim.keymap.set("n", "gd", Snacks.picker.lsp_definitions, { desc = "[g]o [d]efinition" })
vim.keymap.set("n", "gD", Snacks.picker.lsp_declarations, { desc = "[g]o [D]eclaration" })
vim.keymap.set("n", "gt", Snacks.picker.lsp_type_definitions, { desc = "[g]o [t]ype" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
