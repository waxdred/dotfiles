local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"

    lspconfig.solidity.setup {
        on_attach = on_attach,
        cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
        filetypes = { 'solidity' },
        root_dir = require("lspconfig.util").find_git_ancestor,
        single_file_support = true,
    }
end

return M
