local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
	vim.keymap.set('n', 'gD', "<c-w><c-]><c-w>T", { desc = 'LSP definitions in new Tab' })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)       -- Show docs
end
local configs = {'clangd', 'pyright', 'bashls', 'ts_ls', 'lua_ls'}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_lists = require('config.lsp_lists')

for lsp, config in pairs(lsp_lists) do
	config["capabilities"] = capabilities
	config["on_attach"] = on_attach
	vim.lsp.config(lsp, config)
	vim.lsp.enable(lsp)
end
