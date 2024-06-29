return {
	"neovim/nvim-lspconfig",

	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },

		-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		{ "folke/lazydev.nvim", opts = {} },
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor.
				--  This is where a variable was first declared, or where a function is defined, etc.
				--  To jump back, press <C-t>.
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>sy", require("telescope.builtin").lsp_document_symbols, "[S]earch s[Y]mbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				vim.keymap.set("n", "<leader>rn", function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end, { expr = true })
				--
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				map("K", vim.lsp.buf.hover, "Hover Documentation")
				-- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- The following autocommand is used to enable inlay hints in your
				-- code, if the language server you are using supports them
				--
				-- This may be unwanted, since they displace some of your code
				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>tih", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "[T]oggle [I]nlay [H]ints")
				end
			end,
		})

		--       -- LSP servers and clients are able to communicate to each other what features they support.
		--       --  By default, Neovim doesn't support everything that is in the LSP specification.
		--       --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--       --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		--
		--       -- Enable the following language servers
		--       --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--       --
		--       --  Add any additional override configuration in the following tables. Available keys are:
		--       --  - cmd (table): Override the default command used to start the server
		--       --  - filetypes (table): Override the default list of associated filetypes for the server
		--       --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--       --  - settings (table): Override the default settings passed when initializing the server.
		--       --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		--
		-- INFO: ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
		local servers = {
			-- Some languages (like typescript) have entire language plugins that can be useful:
			--    https://github.com/pmizio/typescript-tools.nvim
			-- tsserver = {
			--   init_options = {
			--     preferences = {
			--       importModuleSpecifierPreference = 'relative',
			--       importModuleSpecifierEnding = 'minimal',
			--     },
			--   },
			-- },
			terraformls = {},
			svelte = {
				-- BUG: not working- svelte not updating on ts file change
				-- on_attach = function(client, bufnr)
				-- 	vim.api.nvim_create_autocmd('BufWritePost', {
				-- 		pattern = { '*.js', '*.ts' },
				-- 		callback = function(ctx)
				-- 			-- Here use ctx.match instead of ctx.file
				-- 			client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
				-- 		end,
				-- 	})
				-- end,
				-- on_attach = function(client)
				--   vim.api.nvim_create_autocmd('BufWritePost', {
				--     pattern = { '*.js', '*.ts' },
				--     callback = function(ctx)
				--       client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.file })
				--     end,
				--   })
				-- end,
			},
			-- eslint = {}, -- its LSP =  Due to the bug, install specific version of lsp to show diagnostics :MasonInstall eslint-lsp@4.8.0
			eslint = {}, -- lsp
			eslint_d = {}, -- formatter
			tflint = {},
			jsonlint = {},
			hadolint = {},
			markdownlint = {},
			prettierd = {},
			-- golant
			gopls = {},
			goimports = {},
			templ = {},
			-- golangci-lint = {}, // install manually through :Mason
			golangci_lint_ls = {},

			-- html
			htmlbeautifier = {
				filetypes = { "template", "gotempl" },
			},
			htmlhint = {
				filetypes = { "template", "gotempl" },
			},
			html = {
				filetypes = { "template", "gotempl" },
			},
			tailwindcss = {},

			-- lua
			lua_ls = {
				-- cmd = {...},
				-- filetypes = { ...},
				-- capabilities = {},
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						diagnostics = { disable = { "missing-fields" } },
					},
				},
			},
		}

		require("mason").setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					--
					-- server.filetypes = (servers[server_name] or {}).filetypes

					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
