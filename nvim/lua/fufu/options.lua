-- INFO: [[ Setting options ]]
-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

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

vim.g.oaded_netrw = 1 -- FIXME: typo, check what happens if i fix it
vim.g.loaded_netrwPlugin = 1
