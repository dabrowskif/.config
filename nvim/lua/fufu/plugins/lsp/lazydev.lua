return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"Bilal2453/luvit-meta",
		lazy = true,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			name = "lazydev", table.insert(opts.sources, {
				group_index = 0,
			})
		end,
	},
	{
		"folke/neodev.nvim",
		enabled = false, -- disable this as it inferes with lazydev
	},
}
