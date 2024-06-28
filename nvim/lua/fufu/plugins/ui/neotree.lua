return {
	'nvim-neo-tree/neo-tree.nvim',
	lazy = false,
	branch = "v3.x",
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	config = function()
		vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

		vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
		vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
		vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
		vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

		vim.keymap.set('n', '<leader>te', ':Neotree toggle<cr>', { desc = '[T]oggle file [E]xplorer' })

		require('neo-tree').setup {
			event_handlers = {
				event = 'neo_tree_buffer_enter',
				handler = function()
					vim.opt_local.relativenumber = true
				end,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
			window = {
				mappings = {
					['t'] = {
						'toggle_node',
						nowait = false,
					},
				},
			},
		}
	end,
}
