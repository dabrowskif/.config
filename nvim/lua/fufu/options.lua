vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.hlsearch = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = true
vim.opt.scrolloff = 30
vim.opt.swapfile = false
vim.opt.inccommand = "split"
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set("n", "<A-Right>", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<A-Left>", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<A-Down>", ":resize +3<CR>", { silent = true })
vim.keymap.set("n", "<A-Up>", ":resize -3<CR>", { silent = true })

vim.keymap.set("n", "<leader>wa", "<cmd>silent! wa!<cr>", { desc = "Write all (ignore errors)" })

-- ripgrep for search
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.g.oaded_netrw = 1 -- FIXME: typo, check what happens if i fix it
vim.g.loaded_netrwPlugin = 1
