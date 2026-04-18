return {
	{
		"windwp/nvim-ts-autotag",
		-- This ensures it only loads when you actually open a file
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags: <View> -> <View></View>
					enable_rename = true, -- Auto rename: change <View> to <Text> and the end tag follows
					enable_close_on_slash = true, -- Auto close when you type /
				},
				-- Per-filetype overrides if needed
				per_filetype = {
					["html"] = { enable_close = true },
				},
			})
		end,
	},
}
