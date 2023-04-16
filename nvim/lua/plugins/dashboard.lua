return {
	'goolord/alpha-nvim',
	opts = function()
		local dashboard = require('alpha.themes.dashboard')
		dashboard.section.header.val =
		-- {
		-- '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
		-- '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
		-- '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
		-- '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
		-- '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
		-- '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
		-- }
		-- {
		-- '     .-') _   ('-.                     (`-.           _   .-')    ',
		-- '    ( OO ) )_(  OO)                  _(OO  )_        ( '.( OO )_  ',
		-- ',--./ ,--,'(,------. .-'),-----. ,--(_/   ,. \\ ,-.-') ,--.   ,--.)',
		-- '|   \\ |  |\\ |  .---'( OO'  .-.  '\\   \\   /(__/ |  |OO)|   `.'   | ',
		-- '|    \\|  | )|  |    /   |  | |  | \\   \\ /   /  |  |  \\|         | ',
		-- '|  .     |/(|  '--. \\_) |  |\\|  |  \\   '   /,  |  |(_/|  |'.'|  | ',
		-- '|  |\\    |  |  .--'   \\ |  | |  |   \\     /__),|  |_.'|  |   |  | ',
		-- '|  | \\   |  |  `---.   `'  '-'  '    \\   /   (_|  |   |  |   |  | ',
		-- '`--'  `--'  `------'     `-----'      `-'      `--'   `--'   `--' ',
		-- }
		-- {
		-- ' ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓',
		-- ' ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒',
		-- '▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░',
		-- '▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ',
		-- '▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒',
		-- '░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░',
		-- '░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░',
		-- '   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ',
		-- '         ░    ░  ░    ░ ░        ░   ░         ░   ',
		-- '                                ░                  ',
		-- }
		-- {
		-- '███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ',
		-- '███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ',
		-- '███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ',
		-- '███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ',
		-- '███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ',
		-- '███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ',
		-- '███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ',
		-- ' ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ',
		-- }
		-- {
		-- ' ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·. ',
		-- '•█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪',
		-- '▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·',
		-- '██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌',
		-- '▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀',
		-- }
		-- {
		-- ' ▄▀▀▄ ▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▀▀▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀█▀▄    ▄▀▀▄ ▄▀▄ ',
		-- '█  █ █ █ ▐  ▄▀   ▐ █      █ █   █    █ █   █  █  █  █ ▀  █ ',
		-- '▐  █  ▀█   █▄▄▄▄▄  █      █ ▐  █    █  ▐   █  ▐  ▐  █    █ ',
		-- '  █   █    █    ▌  ▀▄    ▄▀    █   ▄▀      █       █    █  ',
		-- '▄▀   █    ▄▀▄▄▄▄     ▀▀▀▀       ▀▄▀     ▄▀▀▀▀▀▄  ▄▀   ▄▀   ',
		-- '█    ▐    █    ▐                       █       █ █    █    ',
		-- '▐         ▐                            ▐       ▐ ▐    ▐    ',
		-- }
		-- {
		-- '   ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█ ',
		-- '    █  █▀   ▀  █   █      █  ██ █ █ █ ',
		-- '██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ ',
		-- '█ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ ',
		-- '█  █ █ ▀███▀           █  █   ▐    █  ',
		-- '█   ██                  █▐        ▀   ',
		-- '                        ▐             ',
		-- }
		{
			'::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::  ',
			':+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+ ',
			':+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+ ',
			'+#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+ ',
			'+#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+ ',
			'#+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+# ',
			'###    #### ########## ########      ###     ########### ###       ### ',
		}
		-- {
		-- '                                                                                         .         .           ',
		-- 'b.             8 8 8888888888       ,o888888o.  `8.`888b           ,8'  8 8888          ,8.       ,8.          ',
		-- '888o.          8 8 8888          . 8888     `88. `8.`888b         ,8'   8 8888         ,888.     ,888.         ',
		-- 'Y88888o.       8 8 8888         ,8 8888       `8b `8.`888b       ,8'    8 8888        .`8888.   .`8888.        ',
		-- '.`Y888888o.    8 8 8888         88 8888        `8b `8.`888b     ,8'     8 8888       ,8.`8888. ,8.`8888.       ',
		-- '8o. `Y888888o. 8 8 888888888888 88 8888         88  `8.`888b   ,8'      8 8888      ,8'8.`8888,8^8.`8888.      ',
		-- '8`Y8o. `Y88888o8 8 8888         88 8888         88   `8.`888b ,8'       8 8888     ,8' `8.`8888' `8.`8888.     ',
		-- '8   `Y8o. `Y8888 8 8888         88 8888        ,8P    `8.`888b8'        8 8888    ,8'   `8.`88'   `8.`8888.    ',
		-- '8      `Y8o. `Y8 8 8888         `8 8888       ,8P      `8.`888'         8 8888   ,8'     `8.`'     `8.`8888.   ',
		-- '8         `Y8o.` 8 8888          ` 8888     ,88'        `8.`8'          8 8888  ,8'       `8        `8.`8888.  ',
		-- '8            `Yo 8 888888888888     `8888888P'           `8.`           8 8888 ,8'         `         `8.`8888. ',
		-- }
		dashboard.section.buttons.val = {
			dashboard.button('l', '  Last Session', '<cmd>lua require(\'user.utils\').RestoreLatestSession()<cr>'),
			dashboard.button('s', '  Saved Sessions', '<cmd>lua require(\'session-lens\').search_session()<cr>'),
			dashboard.button('n', '  New file', '<cmd>ene <BAR> startinsert <cr>'),
			dashboard.button('f', '  Find File', '<cmd>Telescope find_files<cr>'),
			dashboard.button('w', '  Find Word', '<cmd>Telescope live_grep<cr>'),
			-- dashboard.button('b', '  Bookmarks', ''),
			dashboard.button('q', '  Quit NVIM', '<cmd>qa<cr>'),
		}
		return dashboard
	end,
	config = function(_, opts)
		require('alpha').setup(opts.config)
	end
}
