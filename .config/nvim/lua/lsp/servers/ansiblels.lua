local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"

    lspconfig.ansiblels.setup {
        on_attach = on_attach,
        cmd = { "ansible-language-server", "--stdio" },
        filetype = { "yaml.ansible" },
        capabilities = capabilities,
        single_file_support = true,
    }
end

return M
