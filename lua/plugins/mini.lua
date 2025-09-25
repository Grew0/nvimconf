return {
	'nvim-mini/mini.nvim',
	config = function()
		-- If using mini.pairs
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.smarttab = true
		require('mini.pairs').setup({
			mappings = {
				['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\][^%w]' },
				['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\][^%w]' },
				['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\][^%w]' },
				['"'] = { action = 'open', pair = '""', neigh_pattern = '[^%w]' },
				["'"] = { action = 'open', pair = "''", neigh_pattern = '[^%w]' },
				['`'] = { action = 'open', pair = '``', neigh_pattern = '[^%w]' },
			},
		})
	end
};
