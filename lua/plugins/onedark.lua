return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup {
				style = "warmer",
				colors = {
					bg0="#262623",
					bg1="#31302c",
					bg2="#3b3a35",
					bg_d="#1e1e1b"
				}
			}
			require('onedark').load()
		end
	}
}
