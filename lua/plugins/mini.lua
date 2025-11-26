return {
	'nvim-mini/mini.nvim',
	config = function()
		-- If using mini.pairs
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.smarttab = true
		require('mini.pairs').setup({
			modes = { insert = true, command = true, terminal = false },
			mappings = {
				['('] = { action = 'open', pair = '()', neigh_pattern = '.[^%a\\(]' },
				['['] = { action = 'open', pair = '[]', neigh_pattern = '.[^%a\\[]' },
				['{'] = { action = 'open', pair = '{}', neigh_pattern = '.[^%a\\{]' },

				[')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
				[']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
				['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

				['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '.[^%a\\]', register = { cr = false } },
				["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '.[^%a\\]', register = { cr = false } },
				['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '.[^%a\\]', register = { cr = false } },
			},
		})
		require("mini.move").setup({})
	end
};
