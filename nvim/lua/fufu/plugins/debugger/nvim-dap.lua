return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",

		-- Required dependency for nvim-dap-ui
		"nvim-neotest/nvim-nio",

		-- Installs the debug adapters for you
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
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				"delve",
			},
		})

		-- Basic debugging keymaps, feel free to change to your liking!
		vim.keymap.set("n", "<leader>dt", require("dapui").toggle, { desc = "[D]ebugger: toggle" })

		vim.keymap.set("n", "<F1>", dap.continue, { desc = "[D]ebugger: Start/Continue" })
		vim.keymap.set("n", "<F2>", dap.step_into, { desc = "[D]ebugger: Step Into" })
		vim.keymap.set("n", "<F3>", dap.step_over, { desc = "[D]ebugger: Step Over" })
		vim.keymap.set("n", "<F4>", dap.step_out, { desc = "[D]ebugger: Step Out" })
		vim.keymap.set("n", "<F5>", dap.step_back, { desc = "[D]ebugger: Step Back" })
		vim.keymap.set("n", "<F12>", dap.disconnect, { desc = "[D]ebugger: Step Back" })

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebugger: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "[D]ebugger: Set Breakpoint" })

		-- INFO:Dap UI setup
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
		-- vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

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
			-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			-- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
			-- adapters = { 'pwa-node', 'pwa-chrome',  'node-terminal', 'pwa-extensionHost', 'node' }, -- which adapters to register in nvim-dap
			-- adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' },
			adapters = {
				"pwa-node",
				"pwa-chrome",
				"pwa-msedge",
				"node-terminal",
				"pwa-extensionHost",
				"node",
				"chrome",
			},
			-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
			-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
			-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
		})

		local js_based_languages = { "typescript", "javascript", "typescriptreact" }

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
				-- {
				--   type = 'node',
				--   request = 'launch',
				--   name = 'Launch file (node)',
				--   program = '${file}',
				--   cwd = '${workspaceFolder}',
				-- },
				{
					type = "pwa-chrome",
					request = "launch",
					name = 'Start Chrome with "localhost"',
					url = "http://localhost:3000",
					webRoot = "${workspaceFolder}",
					userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
				},
			}
		end
	end,
}
