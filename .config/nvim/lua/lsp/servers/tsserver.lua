
local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"
    lspconfig.tsserver.setup {
        on_attach = on_attach,
        cmd = {"typescript-language-server", "--stdio"}
    }
end

return M
