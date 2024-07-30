return {
	"ggandor/leap.nvim",
	-- dependencies = {
	-- 	"tpope/vim-repeat.nvim",
	-- },
	opts = {},
	config = function(_, opts)
		require("leap").create_default_mappings()
		require("leap").opts.safe_labels = {}
		require("leap").opts.labels = "arstgmneioARSTGMNEIO"

		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
	end,
}
