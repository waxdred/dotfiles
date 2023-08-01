local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"

    lspconfig.sqlls.setup {
        on_attach = on_attach,
        cmd = {"sql-language-server", "up", "--method", "stdio"},
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end

return M
