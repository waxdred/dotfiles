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
    -- config tsserver
    lspconfig["tsserver"].setup({
        on_attach = on_attach,
        cmd = {"typescript-language-server", "--stdio"}
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
      cmd = { "sql-language-server", "up", "--method", "stdio" },
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
    --
    -- config eslint
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
