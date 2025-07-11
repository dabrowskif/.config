return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"mxsdev/nvim-dap-vscode-js",
		{
			"theHamsta/nvim-dap-virtual-text",
			config = function()
				require("nvim-dap-virtual-text").setup({
					commented = true,
				})
			end,
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				"delve",
				"js-debug-adapter",
			},
		})

		vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "[D]ebugger: Toggle UI" })
		vim.keymap.set("n", "<F1>", dap.continue, { desc = "[D]ebugger: Start/Continue" })
		vim.keymap.set("n", "<F2>", dap.step_into, { desc = "[D]ebugger: Step Into" })
		vim.keymap.set("n", "<F3>", dap.step_over, { desc = "[D]ebugger: Step Over" })
		vim.keymap.set("n", "<F4>", dap.step_out, { desc = "[D]ebugger: Step Out" })
		-- vim.keymap.set("n", "<F5>", dap.step_back, { desc = "[D]ebugger: Step Back" })
		-- vim.keymap.set("n", "<F6>", dapui.toggle, { desc = "[D]ebugger: Toggle UI" })
		vim.keymap.set("n", "<F12>", dap.disconnect, { desc = "[D]ebugger: Disconnect" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebugger: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "[D]ebugger: Set Conditional Breakpoint" })
		vim.keymap.set("n", "<leader>dL", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "[D]ebugger: Logpoint" })
		dapui.setup({

			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 1.0 },
					},
					position = "left",
					size = 0.5,
				},
				{
					elements = {
						{ id = "breakpoints", size = 1.0 },
					},
					position = "bottom",
					size = 0.2,
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

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		require("dap-vscode-js").setup({
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			adapters = {
				"pwa-node",
				"pwa-chrome",
				"pwa-msedge",
				"node-terminal",
				"pwa-extensionHost",
			},
		})

		require("dap").adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "js-debug-adapter",
				args = { "${port}" },
			},
		}

		local js_based_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to NestJS",
					address = "localhost",
					port = 9229,
					cwd = "${workspaceFolder}",
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
					skipFiles = { "<node_internals>/**" },
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to Node.js",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				-- Launch file directly
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug current file",
					program = "${file}",
					cwd = "${workspaceFolder}",
					runtimeArgs = { "-r", "ts-node/register" },
					sourceMaps = true,
					console = "integratedTerminal",
				},
			}
		end
	end,
}
