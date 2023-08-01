local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"
    lspconfig.tailwindcss.setup {
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
    }
end

return M
