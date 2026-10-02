return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"gopls",
				"lua_ls",
				"zls",

				-- JavaScript / TypeScript / React Native
				"ts_ls",
				"eslint",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							staticcheck = true,
							analyses = {
								unusedparams = true,
								shadow = true,
							},
						},
					},
				},

				lua_ls = {},
				zls = {},

				-- JavaScript, TypeScript, JSX and TSX
				ts_ls = {},

				-- ESLint diagnostics and fixes
				eslint = {
					settings = {
						workingDirectory = {
							mode = "auto",
						},
					},
				},
			},
		},
	},
}
