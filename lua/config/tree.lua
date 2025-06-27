vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local tree = require("nvim-tree");
local api = require("nvim-tree.api");

tree.setup({
	sort = { sorter = "case_sensitive", },
	view = { width = 30, },
	renderer = { group_empty = true, },
	filters = { dotfiles = true, },
})

vim.keymap.set('n', '<leader>e', function()
	local api = require('nvim-tree.api')
	if api.tree.is_visible() then
		print(vim.bo.filetype)
		if vim.bo.filetype == "NvimTree" then
			api.tree.close()
		else
			api.tree.focus()
		end
	else
		api.tree.open()
	end
end, { desc = 'Toggle nvim-tree focus' })
