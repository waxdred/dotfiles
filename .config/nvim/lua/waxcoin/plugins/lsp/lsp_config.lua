return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end
    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    ------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------config lsp--------------------------------------------------------------------
    ------------------------------------------------------------------------------------------------------------------------------
    --
    -- config bash
    lspconfig["bashls"].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config ansible
    lspconfig["ansiblels"].setup({
      on_attach = on_attach,
        cmd = { "ansible-language-server", "--stdio" },
        filetype = { "yaml.ansible" },
        capabilities = capabilities,
        single_file_support = true,
    })
    --
    -- config ccls
    lspconfig["ccls"].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config clangd
    lspconfig["clangd"].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config cssls
    lspconfig["cssls"].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config dockerls
    lspconfig["dockerls"].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config emmet_ls
    lspconfig["emmet_ls"].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
        root_dir = function()
            return vim.loop.cwd()
        end,
      })
    --
    -- config json
    lspconfig["jsonls"].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config json
    lspconfig["jsonls"].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config go
    lspconfig["gopls"].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config solidity
    lspconfig["solidity"].setup({
      on_attach = on_attach,
        cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
        filetypes = { 'solidity' },
        root_dir = require("lspconfig.util").find_git_ancestor,
        single_file_support = true,
    })
    --
    -- config sql
    lspconfig["sqlls"].setup({
      on_attach = on_attach,
        cmd = {"sql-language-server", "up", "--method", "stdio"},
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config yamlls
    lspconfig["yamlls"].setup({
      on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
    --
    -- config taiwindcss
    lspconfig["tailwindcss"].setup({
      on_attach = on_attach,
        cmd = { "tailwindcss-language-server", "--stdio" },
        tailwindCSS = {
            classAttributes = { "class", "className", "classList", "ngClass" },
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning"
            },
            validate = true
        }
    })
    --
    -- config eslint
    lspconfig["eslint"].setup({
      root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = true
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
            settings = {
                format = {
                    enable = true,
                },
            },
            handlers = {
                ["window/showMessageRequest"] = function(_, result)
                    if result.message:find "ENOENT" then
                        return vim.NIL
                    end

                    return vim.lsp.handlers["window/showMessageRequest"](nil, result)
                end,
            },
    })
  end,
}
