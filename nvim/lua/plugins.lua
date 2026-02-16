vim.pack.add({
	-- ##### DEPENDENCIES #####
	{ src = "https://github.com/nvim-tree/nvim-web-devicons", name = "web-devicons" }, -- for multiple plugins
	{ src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" }, -- for multiple plugins
	{ src = "https://github.com/folke/snacks.nvim", name = "snacks" },
	{ src = "https://github.com/nvim-mini/mini.nvim", name = "mini" },
	{ src = "https://github.com/akinsho/toggleterm.nvim", name = "toggleterm" }, -- for Lazydocker

	-- ##### CODING #####
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter", version = "master" },
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.7"), name = "blink" },
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform" },
	{ src = "https://github.com/github/copilot.vim", name = "copilot" },

	-- ##### NAVIGATION #####
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2", name = "harpoon" },
	{ src = "https://github.com/stevearc/oil.nvim", name = "oil" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator", name = "tmux-navigator" },
	{ src = "https://github.com/folke/flash.nvim", name = "flash" },
	-- @TODO: neo-tree and lsp-file-navigation have proper lsp rename, make it work in oil with Snacks.rename or lsp-file-operations
	-- { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", name = "neo-tree" },
	-- { src = "https://github.com/antosha417/nvim-lsp-file-operations", name = "lsp-file-operations" },

	-- ##### UI #####
	{ src = "https://github.com/folke/tokyonight.nvim", name = "tokyonight" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine" },
	{ src = "https://github.com/MunifTanjim/nui.nvim", name = "nui" },
	{ src = "https://github.com/folke/noice.nvim", name = "noice" },

	-- ##### UTILS #####
	{ src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns" },
	{ src = "https://github.com/mgierada/lazydocker.nvim", name = "lazydocker" },
	{ src = "https://github.com/folke/which-key.nvim", name = "which-key" },
	{ src = "https://github.com/folke/lazydev.nvim", name = "lazydev" },
	{ src = "https://github.com/mason-org/mason.nvim", name = "mason" },
	{ src = "https://github.com/dabrowskif/perch.nvim", name = "perch" },

	-- ##### AI #####
	{ src = "https://github.com/Davidyz/VectorCode", name = "vectorcode" },
	{ src = "https://github.com/olimorris/codecompanion.nvim", name = "codecompanion" },

	-- ##### Debugger #####
	{ src = "https://github.com/rcarriga/nvim-dap-ui", name = "dapui" }, -- dependency
	{ src = "https://github.com/nvim-neotest/nvim-nio", name = "nio" }, -- dependency
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim", name = "mason-nvim-dap" }, -- dependency
	{ src = "https://github.com/mxsdev/nvim-dap-vscode-js", name = "dap-vscode-js" }, -- dependency
	{ src = "https://github.com/mfussenegger/nvim-dap", name = "dap" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text", name = "nvim-dap-virtual-text" }, -- inline hints
})

local Configs = require("plugins-configs")

-- TODO: setup this on startup
-- "uv tool upgrade vectorcode"
--
-- TODO: setup this on startup
-- vim.schedule(function()
-- 	vim.cmd.TSUpdate()
-- end)

require("tokyonight").setup(Configs.tokyonight)
Configs.colorscheme()

require("snacks").setup(Configs.snacks)
require("codecompanion").setup(Configs.codeCompanion)
require("conform").setup(Configs.conform)
require("harpoon"):setup()
require("oil").setup(Configs.oil)
require("gitsigns").setup(Configs.gitsigns)
-- require("neo-tree").setup(Configs.neoTree)
-- require("lsp-file-operations").setup()
require("lualine").setup({})
require("noice").setup()
require("lazydev").setup()
require("mason").setup()
require("mini.hipatterns").setup(Configs.hipatterns)
require("mini.cursorword").setup()
require("mini.surround").setup(Configs.miniSurround)
-- require("mini.pairs").setup()
require("nvim-treesitter.configs").setup(Configs.nvim_treesitter)
require("blink.cmp").setup(Configs.blink)
require("perch").setup(Configs.perch)
require("toggleterm").setup()
require("lazydocker").setup()
require("flash").setup(Configs.flash)
Configs.getNvimDapConfig()
