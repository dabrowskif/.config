local Utils = require("fufu.utils")

local config = {
	"dabrowskif/perch.nvim",
	opts = {
		misc = {
			notes_dir = "~/Documents/perch_notes/",
		},
	},
}

return Utils.apply_dev_mode(config, "~/IT/p/plugins/perch.nvim")
