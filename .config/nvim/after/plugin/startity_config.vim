let g:startify_session_dir = "~/.config/nvim/sessions/"
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Files']            },
        \ { 'type': 'dir',       'header': ['   Directtory ']	 },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_bookmarks = [
	\ {'i': '~/.dotfiles/.config/nvim/init.vim'},
	\ {'p': '~/.dotfiles/.config/nvim/lua/plugin.lua'},
	\ {'l': '~/.dotfiles/.config/nvim/lua/init.lua'},
	\ {'s': '~/.dotfiles/.config/nvim/after/plugin/startity_config.vim'},
	\ {'t': '~/.dotfiles/tmux/.tmux.conf'},
	\ {'f': '~/.dotfiles/.config/fish/config.fish'},
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
