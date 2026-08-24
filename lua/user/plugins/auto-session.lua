-- Replaces olimorris/persisted.nvim (disabled in lua/user/settings.lua) with
-- rmagatti/auto-session. Not part of upstream ayamir/nvimdots.
--
-- Kept `lazy = true` with `cmd` triggers (mirroring how persisted.nvim was
-- wired in the base config) so telescope.nvim isn't forced to load eagerly at
-- startup just because it's listed as a dependency here.
local M = {}

M["rmagatti/auto-session"] = {
	lazy = true,
	cmd = {
		"SessionSave",
		"SessionRestore",
		"SessionDelete",
		"SessionSearch",
		"SessionToggleAutoSave",
	},
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = require("configs.auto-session"),
}

return M
