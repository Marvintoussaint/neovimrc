return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					go = { "goimports", "gofmt" },
					lua = { "stylua" },

					-- JavaScript / React Native
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					json = { "prettier" },
					jsonc = { "prettier" },
					css = { "prettier" },
					markdown = { "prettier" },
				},

				format_on_save = {
					timeout_ms = 2000,
					lsp_format = "fallback",
				},
			})
		end,
	},
}
