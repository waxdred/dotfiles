let g:startify_session_dir = "~/.dotfiles/nvim/sessions"
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Files']            },
        \ { 'type': 'dir',       'header': ['   Directtory ']	 },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_bookmarks = [
	\ {'0': '~/.dotfiles/.config/nvim/init.vim'},
	\ {'1': '~/.dotfiles/.config/nvim/lua/plugin.lua'},
	\ {'2': '~/.dotfiles/.config/nvim/lua/init.lua'},
	\ {'3': '~/.dotfiles/.config/nvim/after/plugin/startity_config.vim'},
	\ {'4': '~/.dotfiles/.config/nvim/lua/plugin.lua'},
	\ {'5': '~/.dotfiles/tmux/.tmux.conf'},
	\ {'6': '~/.dotfiles/.config/fish/config.fish'},
	\ ]

let g:startify_custom_header = [
	\'         _                    _               _        _          _            _             _   _       ',
	\'        /\ \     _           /\ \            /\ \     /\ \    _ / /\          /\ \          /\_\/\_\ _   ',
	\'       /  \ \   /\_\        /  \ \          /  \ \    \ \ \  /_/ / /          \ \ \        / / / / //\_\ ',
	\'      / /\ \ \_/ / /       / /\ \ \        / /\ \ \    \ \ \ \___\/           /\ \_\      /\ \/ \ \/ / / ',
	\'     / / /\ \___/ /       / / /\ \_\      / / /\ \ \   / / /  \ \ \          / /\/_/     /  \____\__/ /  ',
	\'    / / /  \/____/       / /_/_ \/_/     / / /  \ \_\  \ \ \   \_\ \        / / /       / /\/________/   ',
	\'   / / /    / / /       / /____/\       / / /   / / /   \ \ \  / / /       / / /       / / /\/_// / /    ',
	\'  / / /    / / /       / /\____\/      / / /   / / /     \ \ \/ / /       / / /       / / /    / / /     ',
	\' / / /    / / /       / / /______     / / /___/ / /       \ \ \/ /    ___/ / /__     / / /    / / /      ',
	\'/ / /    / / /       / / /_______\   / / /____\/ /         \ \  /    /\__\/_/___\    \/_/    / / /       ',
	\'\/_/     \/_/        \/__________/   \/_________/           \_\/     \/_________/            \/_/        ',
	\]
