return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
		vim.filetype.add({ extension = { templ = "templ" } })
		-- import lspconfig plugin

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Go to definition"
			keymap.set("n", "gd", function()
				require("telescope.builtin").lsp_definitions()
			end, opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>xx", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "<C-k>", vim.diagnostic.goto_prev) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "<C-j>", vim.diagnostic.goto_next) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
		end

		------------------------------------------------------------------------------------------------------------------------------
		------------------------------------------------config lsp--------------------------------------------------------------------
		------------------------------------------------------------------------------------------------------------------------------
		-- configure terraformls server
		vim.lsp.config("terraformls", {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "terraform-ls", "serve" },
			filetypes = { "terraform", "terraform-vars" },
			root_dir = require("lspconfig.util").root_pattern(".terraform", ".git"),
		})

		-- configure golang server with plugin
		vim.lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = on_attach,
			-- filetypes = { "templ", "go" },
			filetypes = { "go" },
		})
		-- configure rust-analyzer server with plugin
		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure bash server with plugin
		vim.lsp.config("bashls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "sh" },
		})
		--- configure arduino language server
		vim.lsp.config("arduino_language_server", {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = {
				"arduino-language-server",
				"-cli",
				"/usr/local/bin/arduino-cli",
				"-fqbn",
				"arduino:avr:uno",
				"-port",
				"/dev/ttyACM0",
				"-log",
				"info",
			},
			filetypes = { "arduino" },
			root_dir = require("lspconfig.util").root_pattern(".git", "."),
		})

		-- configure 	typescript-language-server
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
			},
			cmd = { "typescript-language-server", "--stdio" },
		})

		-- configure docker server with plugin
		vim.lsp.config("dockerls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure docker-compose server with plugin
		vim.lsp.config("docker_compose_language_service", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
