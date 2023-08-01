require('dap-go').setup()

require('dapui').setup()

local status, go = pcall(require, 'go')
if (not status) then return end

go.setup {}
