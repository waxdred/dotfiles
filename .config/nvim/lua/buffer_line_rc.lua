local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup{
	options = {
		mode = 'buffers',
		separator_style = 'padded_slant',
		always_show_bufferline = true,
		show_close_icon = true,
		color_icons = true,
    		buffer_close_icon = '',
	},
	highlights = {
        	tab = {
        	    guifg = '#002b36',
        	    guibg = '#002b36'
        	},
        	close_button = {
        	    guifg = '#ffffff',
        	    guibg = '#002b36'
        	},
        	close_button_visible = {
        	    guifg = '#EE3B31',
        	    guibg = '#002b36'
        	},
        	close_button_selected = {
        	    guifg = '#EE3B31',
        	    guibg = '#002b36'
        	},
        	buffer_visible = {
        	    guifg = '#13A6DA',
        	    guibg = '#002b36'
        	},
        	buffer_selected = {
		    guifg = '#FF6C37',
        	    guibg = '#002b36',
        	    gui = "bold,italic"
        	},
		separator = {
			guifg = '#073642',
			guibg = '#002b36',
		},
		separator_selected = {
			guifg = '#073642',
	},
        };

}
