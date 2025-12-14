function c
	switch $argv
		case 'nvim'
			nvim ~/.config/nvim/init.lua
			return
		case 'fish'
			nvim ~/.config/fish/config.fish
			return
		case 'hypr'
			nvim ~/.config/hypr/hyprland.conf
			return
		case 'tmux'
			nvim ~/.config/tmux/tmux.conf
			return
		case 'foot'
			nvim ~/.config/foot/foot.ini
			return
		case 'waybar'
			nvim ~/.config/waybar/config.jsonc
			return
	end

	echo "Available configs: fish, nvim, alacritty, hypr, tmux, foot"
end
