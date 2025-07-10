global_config_use_mouse = true
require("config.lazy")
require("config.onedark")
require("config.tree")
require("config.telescope")
require("config.keys")
require("config.cmp")
require("config.lualine")

-- making tabs normal
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- turn off the mouse
if global_config_use_mouse then
	vim.cmd("set mouse=")
end
