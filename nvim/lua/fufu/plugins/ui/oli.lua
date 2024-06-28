return {
	'stevearc/oil.nvim',
	opts = {

		lsp_file_methods = {
			-- use_default_keymaps = false,
			timeout_ms = 10000,
			autosave_changes = true,
		},
		default_file_explorer = false,
		keymaps = {
			["<C-c>"] = false,
			['<C-s>'] = false,
			['<C-h>'] = false,
			['<C-q>'] = 'actions.close',
		},
	},
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function(_, opts)
		require('oil').setup(opts)

		-- vim.keymap.set('n', '<leader>to', '<CMD>Oil<CR>', { desc = '[T]oggle [O]il' })
		vim.keymap.set('n', '<leader>to', require('oil').toggle_float, { desc = '[T]oggle [O]il' })
	end,
}
