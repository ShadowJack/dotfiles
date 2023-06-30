require("mason").setup {
  ui = {
    border = "single",
    icons = {
      -- The list icon to use for installed packages.
      package_installed = "✓",
      -- The list icon to use for packages that are installing, or queued for installation.
      package_pending = "◍",
      -- The list icon to use for packages that are not installed.
      package_uninstalled = "✗",
    },
  }
}

-- set up DAP adapters
require("mason-nvim-dap").setup({
	handlers = {},
})
-- Set up debugger for Elixir manually because mason-dap doesn't work somehow
local dap = require('dap')
dap.adapters.mix_task = {
	type = 'executable',
	command = vim.fn.exepath('elixir-ls-debugger'),
	args = {}
}
dap.configurations.elixir = {
	{
		type = "mix_task",
		name = "mix test",
		task = 'test',
		taskArgs = {"--trace"},
		request = "launch",
		startApps = true, -- for Phoenix projects
		projectDir = "${workspaceFolder}",
		requireFiles = {
			"test/**/test_helper.exs",
			"test/**/*_test.exs"
		}
	},
	{
		type = "mix_task",
		name = "phx.server",
		task = 'phx.server',
		request = "launch",
		projectDir = "${workspaceFolder}"
	},
}

-- set up LSP servers
require("mason-lspconfig").setup({
	-- Servers I want to be installed by default for a clean installation of NVim:
	-- mason.nvim name - lspconfig name
	-- typescript-language-server - tsserver
	-- sqlls - sqlls
	-- marksman - marksman
	-- lua-language-server - lua_ls
	-- json-lsp - jsonls
	-- html-lsp - html
	-- diagnostic-languageserver - diagnosticls
	-- erlang-ls - erlangls
	-- csharp-language-server - csharp_ls
	-- css-lsp - cssls
	-- dockerfile-language-server - dockerls
	-- elixir-ls - elixirls
	-- tailwindcss-language-server - tailwindcss
        ensure_installed = { "tsserver", "sqlls", "marksman", "lua_ls", "jsonls", "html", "diagnosticls", "erlangls", "csharp_ls", "cssls", "dockerls", "elixirls", "tailwindcss" },
})

-- set up LSP servers installed via mason.nvim
-- add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name)
		lspconfig[server_name].setup {
		    capabilities = capabilities,
		}
	end,
	-- Dedicated handlers for specific servers.
	["elixirls"] = function ()
		lspconfig.elixirls.setup({
			capabilities = capabilities,
			filetypes = { "elixir", "eelixir", "heex" },
			-- TODO: these settings break the lsp server
			-- settings = {
			--         elixirLS = {
			--                 additionalWatchedExtensions = { "heex" },
			--         }
			-- },
		})
	end,
	["lua_ls"] = function ()
               lspconfig.lua_ls.setup ({
                   settings = {
                       Lua = {
                           diagnostics = {
                               globals = { "vim" }
                           },
				workspace = {
					library = { "~/Documents/work/defold/defoldLua/library" }
				}
                       }
                   }
               })
	end
}

