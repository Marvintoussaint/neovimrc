return {
	{
		"echasnovski/mini.icons",
		version = false, -- Use the latest version
		config = function()
			local icons = require("mini.icons")
			icons.setup({
				-- Minimalist tweak: If you want to customize icons to match
				-- your Electric Cyan (#03D7E3) theme, you can do that here.
				style = "glyph", -- 'glyph' is the most minimalist and clean
			})

			-- This line makes mini.icons "pretend" to be nvim-web-devicons
			-- so that other plugins (like Telescope) use it automatically.
			icons.mock_nvim_web_devicons()
		end,
	},
}
