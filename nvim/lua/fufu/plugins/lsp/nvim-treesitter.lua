-- INFO: [[ Configure Treesitter ]] See `:help nvim-treesitter`
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		-- ensure_installed = { 'bash', 'html', 'lua' },
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = { enable = true },
	},

	config = function(_, opts)
		-- Prefer git instead of curl in order to improve connectivity in some environments
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup(opts)
	end,
}
