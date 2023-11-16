function InputArgs(format)
    local message = vim.fn.input(format)
    if message ~= '' then
        vim.cmd('echo "Message entered: "')
        vim.cmd('echo "' .. message .. '"')
        vim.cmd('G commit -v -m "' .. format .. message .. '"')
    else
        vim.cmd('echo "No message entered. Action canceled"')
    end
end

vim.cmd('command -bar -bang -nargs=* Gfix lua InputArgs("FIX: ")')
vim.cmd('command -bar -bang -nargs=* GUpdate lua InputArgs("UPDATE: ")')
vim.cmd('command -bar -bang -nargs=* Gfeature lua InputArgs("FEATURE: ")')
vim.cmd('command -bar -bang -nargs=* GStyle lua InputArgs("APPEARANCE: ")')
vim.cmd('command -bar -bang -nargs=* GTest lua InputArgs("UNIT-TEST: ")')
vim.cmd('command -bar -bang -nargs=* GRefacto lua InputArgs("REFACTO: ")')
