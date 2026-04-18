return {
	-- Mason: installs LSP servers
	{
		"williamboman/mason.nvim",
		config = true,
	},

	-- Mason <-> LSP bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"tailwindcss",
				"eslint",
			},
		},
	},

	-- LSP runtime config (Native v0.11 style)
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			-- 1. Setup Capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			if ok then
				capabilities = cmp_lsp.default_capabilities(capabilities)
			end

			-- 2. Buffer-local keymaps and logic on Attach
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local bufnr = ev.buf
					local nmap = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
					end

					nmap("gd", vim.lsp.buf.definition, "Go to Definition")
					nmap("gr", require("telescope.builtin").lsp_references, "References")
					nmap("K", vim.lsp.buf.hover, "Hover Documentation")
					nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					nmap("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
				end,
			})

			-- 3. Modern Configuration (Using vim.lsp.config)
			-- This replaces the deprecated require('lspconfig').setup pattern

			-- Lua
			-- Inside your lsp.lua
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				init_options = {
					preferences = {
						-- EXPLANATION: This is the magic setting for auto-imports.
						includeCompletionsForModuleExports = true,
						includeCompletionsWithInsertText = true,
					},
				},
			})

			-- TypeScript / React Native
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			})

			-- Tailwind
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
			})

			-- Flutter / Dart
			vim.lsp.config("dartls", {
				capabilities = capabilities,
			})

			-- 4. Enable the configurations
			-- Note: In v0.11, we still enable these specifically or let
			-- mason-lspconfig's automatic_installation handle the triggers.
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("dartls")

			-- Diagnostics UI
			vim.diagnostic.config({
				virtual_text = { prefix = "●" },
				severity_sort = true,
				float = { border = "rounded", source = "always" },
			})
		end,
	},
}
