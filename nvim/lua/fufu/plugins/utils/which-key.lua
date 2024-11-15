return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		icons = {
			mappings = vim.g.have_nerd_font,
			keys = vim.g.have_nerd_font and {} or {
				Up = "<Up> ",
				Down = "<Down> ",
				Left = "<Left> ",
				Right = "<Right> ",
				C = "<C-…> ",
				M = "<M-…> ",
				D = "<D-…> ",
				S = "<S-…> ",
				CR = "<CR> ",
				Esc = "<Esc> ",
				ScrollWheelDown = "<ScrollWheelDown> ",
				ScrollWheelUp = "<ScrollWheelUp> ",
				NL = "<NL> ",
				BS = "<BS> ",
				Space = "<Space> ",
				Tab = "<Tab> ",
				F1 = "<F1>",
				F2 = "<F2>",
				F3 = "<F3>",
				F4 = "<F4>",
				F5 = "<F5>",
				F6 = "<F6>",
				F7 = "<F7>",
				F8 = "<F8>",
				F9 = "<F9>",
				F10 = "<F10>",
				F11 = "<F11>",
				F12 = "<F12>",
			},
		},

		-- Document existing key chains
		-- spec = {
		--   { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
		--   { '<leader>d', group = '[D]ocument' },
		--   { '<leader>r', group = '[R]ename' },
		--   { '<leader>s', group = '[S]earch' },
		--   { '<leader>w', group = '[W]orkspace' },
		--   { '<leader>t', group = '[T]oggle' },
		--   { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
		-- },
	},
}

-- return {
-- "folke/which-key.nvim",
-- event = "VimEnter",
-- config = function()
-- 	require("which-key").setup({
-- 		triggers = {
-- 			{ "<leader>c", group = "[C]ode" },
-- 			{ "<leader>c_", hidden = true },
-- 			{ "<leader>d", group = "[D]ebugger" },
-- 			{ "<leader>d_", hidden = true },
-- 			{ "<leader>h", group = "Git [H]unk" },
-- 			{ "<leader>h_", hidden = true },
-- 			{ "<leader>r", group = "[R]ename" },
-- 			{ "<leader>r_", hidden = true },
-- 			{ "<leader>s", group = "[S]earch" },
-- 			{ "<leader>s_", hidden = true },
-- 			{ "<leader>t", group = "[T]oggle" },
-- 			{ "<leader>t_", hidden = true },
-- 			{ "<leader>v", group = "Custom helpers" },
-- 			{ "<leader>v_", hidden = true },
-- 			{ "<leader>w", group = "[W]orkspace" },
-- 			{ "<leader>w_", hidden = true },
-- 		},
-- 	})
-- end,
-- }
