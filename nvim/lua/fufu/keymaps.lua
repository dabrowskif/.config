-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move lines block" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move lines block" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center upon moving vertically" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center upon moving vertically" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center upon searching vertically" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center upon searching vertically" })

vim.keymap.set("n", "x", '"_x', { desc = "Delete omiting the register" })

-- Treat golang templ as template
-- vim.cmd 'autocmd BufNewFile,BufRead *.templ setfiletype template'

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [d]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [d]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [q]uickfix list" })

vim.keymap.set("n", "<leader>vr", ":LspRestart<CR>", { desc = "Restart LSP", silent = true })
vim.keymap.set("n", "<leader>vq", ":wqa!<CR>", { desc = "Save all and [q]uit Neovim", silent = true })
-- vim.keymap.set("n", "<leader>vs", ":wa!<CR>", { desc = "Save all files", silent = true })
vim.keymap.set("n", "<leader>vch", ":checkhealth ", { desc = "[C]heck[h]ealth of specific plugin" })
vim.keymap.set("n", "<leader>vh", ":help ", { desc = "[h]elp of specific plugin" })
