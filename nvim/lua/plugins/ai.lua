-- Vectorcode - creating vector db for LLLM context providing
vim.pack.add({ { src = "https://github.com/Davidyz/VectorCode", name = "vectorcode" } })
-- "uv tool upgrade vectorcode", -- should run on startup to keep up to date

-- Codecompanion - for AI chats
vim.pack.add({ { src = "https://github.com/olimorris/codecompanion.nvim", name = "codecompanion" } })

---@type CodeCompanion
local codeCompanionOpts = {
	{
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
		---@type CodeCompanion.Strategies
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
	},
}

require("codecompanion").setup(codeCompanionOpts)
