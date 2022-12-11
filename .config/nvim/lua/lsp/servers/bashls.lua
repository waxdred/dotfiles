local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"

    lspconfig.bashls.setup {
        on_attach = on_attach,
        name = 'bash-language-server',
        cmd = { 'bash-language-server', 'start' },
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end

return M
