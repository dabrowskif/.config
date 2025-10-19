local Configs = {}

Configs.nvim_treesitter = {
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = { enable = true },
}

---@type conform.setupOpts
Configs.conform = {
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", "biome", stop_after_first = true },
		typescript = { "prettierd", "prettier", "biome", stop_after_first = true },
		svelte = { "prettierd", "prettier", "biome", stop_after_first = true },
	},
}

---@type snacks.config
Configs.snacks = {
	notifier = {},
	picker = {
		win = {
			input = {
				keys = {
					["<C-e>"] = { "confirm", mode = { "n", "i" } },
				},
			},
		},
	},
	zen = {},
}

---@type oil.SetupOpts
Configs.oil = {
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = true,
	watch_for_changes = false,
	float = {
		max_width = 0.5,
		max_height = 0.5,
		border = "rounded",
	},
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 10000,
		-- autosave_changes = true,
	},
}

---@type blink.cmp.Config
Configs.blink = {
	keymap = {
		preset = "none",
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-f>"] = { "scroll_documentation_up" },
		["<C-b>"] = { "scroll_documentation_down" },
		["<C-e>"] = { "accept" },
		["<C-Space>"] = { "show" },
	},
	signature = {
		enabled = true,
		window = { show_documentation = true },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
}

Configs.hipatterns = {
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
}

---@type CodeCompanion
Configs.codeCompanion = {
	---@type CodeCompanion.Extensions
	extensions = {
		vectorcode = {
			---@type VectorCode.CodeCompanion.ExtensionOpts
			opts = {
				tool_group = {
					enabled = true,
					extras = {
						-- TODO: setup
						"file_search",
					},
					collapse = false,
				},
				tool_opts = {
					["*"] = {},
					ls = {},
					vectorise = {},
					query = {
						max_num = { chunk = -1, document = -1 },
						default_num = { chunk = 50, document = 10 },
						include_stderr = false,
						use_lsp = false,
						no_duplicate = true,
						chunk_mode = false,
						summarise = {
							enabled = false,
							adapter = nil,
							query_augmented = true,
						},
					},
					files_ls = {},
					files_rm = {},
				},
			},
		},
	},
	strategies = {
		chat = {
			adapter = "anthropic",
		},
		inline = {
			adapter = "anthropic",
		},
		cmd = {
			adapter = "anthropic",
		},
	},
	adapters = {
		http = {
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = {
						-- INFO: Adjust the path if needed
						api_key = "cmd:~/.config/nvim/scripts/extract-env.sh ANTHROPIC_KEY ~/.config/nvim/.env",
					},
					schema = {
						model = {
							default = "claude-sonnet-4-5-20250929",
						},
					},
				})
			end,
			openai = function()
				return require("codecompanion.adapters").extend("openai", {
					env = {
						-- INFO: Adjust the path if needed
						api_key = "cmd:~/.config/nvim/scripts/extract-env.sh OPENAI_KEY ~/.config/nvim/.env",
					},
				})
			end,
		},
	},
}

---@type Perch.Options
Configs.perch = {
	misc = {
		notes_dir = "~/Documents/perch_notes/",
		file_extension = "md",
	},
}

return Configs
