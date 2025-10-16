local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
	vim.keymap.set('n', 'gD', "<c-w><c-]><c-w>T", { desc = 'LSP definitions in new Tab' })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)       -- Show docs
end
local configs = {'clangd', 'pyright', 'bashls', 'ts_ls'}
for _, i in ipairs(configs) do
	vim.lsp.enable(i)
	vim.lsp.config(i, {on_attach=on_attach})
end

