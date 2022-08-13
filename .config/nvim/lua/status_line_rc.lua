local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup{
	option = {
		icons_enable= true,
		theme = 'solarized_dark',
		component_separators = { left = '', right = ''},
    		section_separators = { left = '', right = ''},
		disabled_filetypes = {
      			statusline = {},
      			winbar = {},
		},
		sections = {
			lualine_a = {'mode'},
    			lualine_b = {'branch'},
    			lualine_c = {'filename'},
    			lualine_x = {'diagnostics', sources = { 'nvim_diagnostic' }, symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'} },
    			lualine_y = {'progress'},
    			lualine_z = {'location'}
		},
		inactive_sections = {
			lualine_a = {},
    			lualine_b = {},
    			lualine_c = { { 'filename', file_status = true, path = 1 }},
    			lualine_x = {'location'},
    			lualine_y = {},
    			lualine_z = {}
		}
	}
}
