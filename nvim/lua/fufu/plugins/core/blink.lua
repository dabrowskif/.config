return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	-- optional snippets, to be refined...
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
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
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "markdown" },
			providers = {
				snippets = {
					opts = {
						search_paths = { "~/.config/nvim/lua/fufu/snippets/typescript.json" },
					},
				},
				markdown = {
					name = "RenderMarkdown",
					module = "render-markdown.integ.blink",
					fallbacks = { "lsp" },
				},
			},
			min_keyword_length = function(ctx)
				if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
					return 2
				end
				return 0
			end,
		},
	},
	opts_extend = { "sources.default" },
}
