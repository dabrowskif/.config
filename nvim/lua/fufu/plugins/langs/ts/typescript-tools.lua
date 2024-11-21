return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		settings = {
			expose_as_code_action = "all",
			tsserver_file_preferences = function()
				return {
					importModuleSpecifierPreference = "relative",
					includeInlayParameterNameHints = "all",
					includeCompletionsForModuleExports = true,
					quotePreference = "auto",
				}
			end,
			tsserver_format_options = function()
				return {
					allowIncompleteCompletions = false,
					allowRenameOfImportPath = false,
				}
			end,
		},
	},
}
