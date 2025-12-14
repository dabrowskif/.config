function s
	switch $argv
		case ''
			source ~/.config/fish/config.fish
			return
		case 't'
			tmux source ~/.config/tmux/tmux.conf	
			return
	end
end
