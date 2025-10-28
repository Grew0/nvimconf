local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
	vim.keymap.set('n', 'gD', "<c-w><c-]><c-w>T", { desc = 'LSP definitions in new Tab' })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)       -- Show docs
end
local configs = {'clangd', 'pyright', 'bashls', 'ts_ls', 'lus_ls'}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, i in ipairs(configs) do
	local config = {
		on_attach=on_attach,
		capabilities=capabilities
	}

	if i == 'lus_ls' then
		config['filetypes'] = { 'lua' }
		config["cmd"] = {"lua-language-server"}
		config["settings"] = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostics = {
					globals = {
						'vim',        -- основные глобальные переменные vim
					},
				},
				workspace = {
					-- Сделать библиотеку Neovim доступной
					library = {
						[vim.fn.expand('$VIMRUNTIME/lua')] = true,
						[vim.fn.expand('$VIMRUNTIME/lua/vim')] = true,
						[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
						[vim.fn.expand('$VIMRUNTIME/optwin.vim')] = true,
						[vim.fn.stdpath('config') .. '/lua'] = true, -- ваши кастомные плагины
					},
					maxPreload = 10000,
					preloadFileSize = 10000,
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		}
	end

	vim.lsp.config(i, config)
	vim.lsp.enable(i)
end

