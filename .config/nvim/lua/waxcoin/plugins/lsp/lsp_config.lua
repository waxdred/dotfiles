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
		local lspconfig = require("lspconfig")

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
			keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- go to declaration

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>xx", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
		end

		------------------------------------------------------------------------------------------------------------------------------
		------------------------------------------------config lsp--------------------------------------------------------------------
		------------------------------------------------------------------------------------------------------------------------------
		lspconfig["templ"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "templ", "lsp" },
			filetypes = { "templ" },
			-- root_pattern('go.work', 'go.mod', '.git'),
			root_dir = function(fname)
				return lspconfig.util.root_pattern("go.work", "go.mod", ".git")(fname) or vim.fn.getcwd()
			end,
		})
		-- configure htmx server
		lspconfig["htmx"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})

		-- configure terraformls server
		lspconfig["terraformls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "terraform-ls", "serve" },
			filetypes = { "terraform", "terraform-vars" },
			root_dir = lspconfig.util.root_pattern(".terraform", ".git"),
		})
		-- configure tflint terraform server
		lspconfig["tflint"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "tflint", "--langserver" },
			filetypes = { "terraform" },
			root_dir = lspconfig.util.root_pattern(".terraform", ".git", ".tflint.hcl"),
		})
		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "templ" },
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure golang server with plugin
		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "templ", "go" },
		})

		-- configure bash server with plugin
		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "sh" },
		})

		-- configure docker server with plugin
		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure docker-compose server with plugin
		lspconfig["docker_compose_language_service"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure C language server
		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "templ", "astro", "javascript", "typescript", "react" },
			init_options = { userLanguages = { templ = "html" } },
		})

		-- configure svelte server
		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		-- configure prisma orm server
		lspconfig["prismals"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure graphql language server
		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure rust server
		lspconfig["rust_analyzer"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "rust-analyzer" },
			filetypes = { "rust", "rs" },
			root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
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
