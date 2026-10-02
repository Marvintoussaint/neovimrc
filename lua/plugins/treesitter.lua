return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- The rewrite simplifies the architecture; we now use 'init' and 'config' cleanly.
		init = function()
			-- 1. Enable Neovim's core Treesitter highlighting and indenting via autocmd
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
		config = function()
			-- 2. Define the parsers you want to guarantee are installed
			local ensure_installed = {
				"go",
				"gomod",
				"gowork",
				"gosum",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"zog",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"jsonc",
				"html",
				"css",
				"markdown",
			}

			-- 3. Check what's already there and install the missing ones using the new API
			local already_installed = require("nvim-treesitter.config").get_installed()
			local to_install = vim.iter(ensure_installed)
				:filter(function(parser)
					return not vim.tbl_contains(already_installed, parser)
				end)
				:totable()

			if #to_install > 0 then
				require("nvim-treesitter").install(to_install)
			end
		end,
	},
}
