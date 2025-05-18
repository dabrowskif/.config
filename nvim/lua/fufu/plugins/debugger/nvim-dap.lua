return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		-- Add your own debuggers here
		-- 'leoluz/nvim-dap-go',
		"mxsdev/nvim-dap-vscode-js",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,

			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				"delve",
			},
		})

		vim.keymap.set("n", "<leader>dt", require("dapui").toggle, { desc = "[D]ebugger: toggle" })
		vim.keymap.set("n", "<F1>", dap.continue, { desc = "[D]ebugger: Start/Continue" })
		vim.keymap.set("n", "<F2>", dap.step_into, { desc = "[D]ebugger: Step Into" })
		vim.keymap.set("n", "<F3>", dap.step_over, { desc = "[D]ebugger: Step Over" })
		vim.keymap.set("n", "<F4>", dap.step_out, { desc = "[D]ebugger: Step Out" })
		vim.keymap.set("n", "<F5>", dap.step_back, { desc = "[D]ebugger: Step Back" })
		vim.keymap.set("n", "<F12>", dap.disconnect, { desc = "[D]ebugger: Disconnest" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebugger: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "[D]ebugger: Set Breakpoint" })

		-- :help nvim-dap-ui
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.85,
						},
						{
							id = "breakpoints",
							size = 0.15,
						},
						-- {
						--   id = 'stacks',
						--   size = 0.25,
						-- },
						-- {
						--   id = 'watches',
						--   size = 0.25,
						-- },
					},
					position = "left",
					size = 180,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 20,
				},
			},

			controls = {
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = "",
				},
			},
		})

		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		vim.keymap.set("n", "<F6>", dapui.toggle, { desc = "Debug: See last session result." })

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Install golang specific config
		-- require('dap-go').setup {
		--   delve = {
		--     -- On Windows delve must be run attached or it crashes.
		--     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
		--     detached = vim.fn.has 'win32' == 0,
		--   },
		-- }

		require("dap-vscode-js").setup({
			-- node_path = "node",
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			-- debugger_cmd = { "extension" },
			adapters = {
				"pwa-node",
				"node",
			},
			-- log_file_path = "(stdpath cache)/dap_vscode_js.log",
			-- log_file_level = 0,
			-- log_console_level = vim.log.levels.ERROR,
		})

		local js_based_languages = { "typescript", "javascript" }

		-- require("dap").adapters["pwa-node"] = {
		-- 	type = "server",
		-- 	host = "localhost",
		-- 	port = "${port}",
		-- 	executable = {
		-- 		command = "js-debug-adapter",
		-- 		args = { "${port}" },
		-- 	},
		-- }

		for _, language in ipairs(js_based_languages) do
			require("dap").configurations[language] = {
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "node",
					request = "launch",
					name = "Launch file (node)",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}
		end
	end,
}
