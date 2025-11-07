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
	},
	omnisharp={
		cmd = {
			"omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()),
			"--dotnet-cli-telemetry-output", "off", "--project-load-timeout", "120"
		},
		settings = {
			-- FormattingOptions = {
			-- 	EnableEditorConfigSupport = false,
			-- 	OrganizeImports = true,
			-- },
			Sdk = {
				IncludePrereleases = true,
			},
			MSBuild= {
				UseLegacySdkResolver= true,
				LoadProjectsOnDemand= true
			},
			RoslynExtensionsOptions= {
				enableAnalyzersSupport= true,
				enableImportCompletion= true
			},
			FormattingOptions={
				enableEditorConfigSupport= true
			}
		},
	}
}
