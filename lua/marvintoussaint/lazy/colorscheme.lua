return {
	{
		"Mofiqul/dracula.nvim",
		priority = 1000, -- load before other UI plugins
		config = function()
			require("dracula").setup({
				transparent_bg = false,
				italic_comment = true,
			})

			vim.cmd.colorscheme("dracula")
		end,
	},
}
