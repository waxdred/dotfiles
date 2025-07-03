return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"bashls",
				"clangd",
				"zls",
				"cmake",
				"pylsp",
				"tailwindcss-language-server",
				"typescript-language-server",
				"lua-language-server",
				"ansiblels",
				"tailserver",
				"tailwindcss",
				"cssls",
				"html",
				"htmx",
				"templ",
				"yamlls",
				"dockerls",
				"rust-analyzer",
				"gopls",
				"ts_ls",
				"lua_ls",
				"solidity",
				"terraformls",
				"tflint",
			},
			handlers = nil,
			-- auto-install configured servers (with lspconfig)
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}
