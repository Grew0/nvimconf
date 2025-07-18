local lspconfig = require("lspconfig")

local on_attach = {
	data = {
		errs = false
	},
	main = function(data)
		return function(client, bufnr)
			local opts = { buffer = bufnr }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)       -- Show docs
			local switch_errors = function()
				data.errs = not data.errs
				vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {
						virtual_text = data.errs,
						signs = data.errs,
						underline = true,
						severity_sort = true,
				})
				if data.errs then print("W&E on")
				else print("W&E off") end
			end
			data.errs = not data.errs;
			switch_errors();
			vim.keymap.set("n", "<leader>w", function() 
				switch_errors();
				vim.cmd(":LspRestart");
			end);
		end
	end
}

-- local on_attach = function(client, bufnr)
-- 	local opts = { buffer = bufnr }
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)       -- Show docs
--
-- 	print("LSP attached")
-- 	local errs = {
-- 		val = true,
-- 		create = function(errs)
-- 			return function()
-- 				errs.val = not errs.val
-- 				vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- 				vim.lsp.diagnostic.on_publish_diagnostics, {
-- 						virtual_text = errs.val,
-- 						signs = errs.val,
-- 						underline = true,
-- 						severity_sort = true,
-- 				})
-- 				if errs.val then print("W&E on")
-- 				else print("W&E off") end
-- 				vim.cmd(":LspRestart")
-- 			end
-- 		end
-- 	};
-- 	vim.keymap.set("n", "<leader>w", errs.create(errs))
-- end

-- Configure each LSP
lspconfig.clangd .setup({ on_attach = on_attach.main(on_attach.data) })       -- C++
lspconfig.pyright.setup({ on_attach = on_attach.main(on_attach.data) })     -- Python
lspconfig.bashls .setup({ on_attach = on_attach.main(on_attach.data) })      -- Bash
lspconfig.ts_ls  .setup({ on_attach = on_attach.main(on_attach.data) })    -- JS/TS


