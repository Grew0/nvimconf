local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)       -- Show docs
end

-- Configure each LSP
lspconfig.clangd.setup({ on_attach = on_attach })       -- C++
lspconfig.pyright.setup({ on_attach = on_attach })     -- Python
lspconfig.bashls.setup({ on_attach = on_attach })      -- Bash
lspconfig.ts_ls.setup({ on_attach = on_attach })    -- JS/TS
