return {
	clangd={},
	pyright={},
	bashls={},
	ts_ls={},
	lua_ls={
		filetypes = { 'lua' },
		cmd = {"lua-language-server"},
		settings = {
			Lua = {
				runtime = { version = 'LuaJIT', },
				diagnostics = { globals = { 'vim', }, },
				workspace = {
					library = {
						[vim.fn.expand('$VIMRUNTIME/lua')] = true,
						[vim.fn.expand('$VIMRUNTIME/lua/vim')] = true,
						[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
						[vim.fn.expand('$VIMRUNTIME/optwin.vim')] = true,
						[vim.fn.stdpath('config') .. '/lua'] = true, -- ваши кастомные плагины
					},
					maxPreload = 10000, preloadFileSize = 10000, checkThirdParty = false,
				},
				telemetry = { enable = false, },
			},
		}
	}
}
