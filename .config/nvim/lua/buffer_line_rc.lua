local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup{
	options = {
		mode = 'buffers',
		separator_style = 'slant',
		always_show_bufferline = true,
		show_close_icon = true,
		color_icons = true,
		ndicator_icon = '▎',
    		buffer_close_icon = '',
    		modified_icon = '●',
    		close_icon = '',
    		left_trunc_marker = '',
    		right_trunc_marker = '',
	},
	highlights = {
		separator = {
			guifg = '#073642',
			guibg = '#002b36',
		},
		separator_selected = {
			guifg = '#073642',
		},
		background = {
			guifg = '#657b83',
			guibg = '#002b36'
		},
		buffer_selected = {
			guifg = '#fbf6e3',
			gui = 'bold'
		},
		fill = {
			guifg = '#073642',
		}
	}
}
