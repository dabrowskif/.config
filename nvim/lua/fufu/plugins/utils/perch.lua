local Utils = require("fufu.utils")

local config = {
	"dabrowskif/perch.nvim",
	---@type Perch.Options
	opts = {
		misc = {
			notes_dir = "~/Documents/perch_notes/",
			file_extension = "md",
		},
	},
}

return Utils.apply_dev_mode(config, "~/IT/p/plugins/perch.nvim")
