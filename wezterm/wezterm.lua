local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.colors = {
-- 	-- INFO: custom colors
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#706b4e",
-- 	selection_fg = "#f3d9c4",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
--
-- 	-- INFO:  tab bars
-- 	tab_bar = {
-- 		background = "#000000",
-- 		active_tab = {
-- 			bg_color = "#000449",
-- 			fg_color = "#ffffff",
-- 			intensity = "Bold",
-- 		},
-- 		inactive_tab = {
-- 			bg_color = "#000000",
-- 			fg_color = "#FFFFFF",
-- 		},
-- 		new_tab = {
-- 			bg_color = "#000000",
-- 			fg_color = "#FFFFFF",
-- 		},
-- 	},
-- }

-- config.font = wezterm.font("Monaspace Argon", { weight = "Medium" })
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.color_scheme = "tokyonight_night"
config.font_size = 15
config.enable_scroll_bar = true

-- config.background = {
-- 	{
-- 		source = {
-- 			File = "/Users/filip.dabrowski/Public/wallpaper-ilidan.jpg",
-- 		},
-- 		hsb = {
--
-- 			brightness = 0.02,
-- 			hue = 1,
-- 			saturation = 1,
-- 		},
-- 	},
-- }

-- config.window_decorations = "RESIZE"
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

config.skip_close_confirmation_for_processes_named = {
	"sh",
	"zsh",
	"nvim",
	"wezterm",
}

config.keys = {
	{ key = "LeftArrow", mods = "SHIFT", action = wezterm.action({ MoveTabRelative = -1 }) },
	{ key = "RightArrow", mods = "SHIFT", action = wezterm.action({ MoveTabRelative = 1 }) },
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	})
end
-- config.use_fancy_tab_bar = false
config.enable_tab_bar = false

return config
