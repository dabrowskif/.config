-- Incremental rename
return {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup({
			--- NOTE: noice for UI input
			---@diagnostic disable-next-line: assign-type-mismatch
			input_buffer_type = "noice",
			post_hook = function()
				-- Save all buffers after the rename operation
				vim.cmd("wa")
			end,
		})
	end,
}
