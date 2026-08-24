-- Overrides the session keymaps bound in lua/keymap/editor.lua (which target
-- olimorris/persisted.nvim's commands) so they drive rmagatti/auto-session
-- instead. Not part of upstream ayamir/nvimdots.
--
-- lua/keymap/init.lua requires this module *after* lua/keymap/editor.lua has
-- already bound <leader>ss/<leader>sl/<leader>sd, then feeds it through
-- modules.utils.keymap.replace(), which deletes the existing mapping for each
-- key below before re-registering it. That expects a flat
-- `table<"mode|lhs", map_rhs>` map (the same shape bind.nvim_load_mapping
-- consumes) -- NOT the list of `require("user.keymap.<group>")` tables shown
-- in lua/user_template/keymap/init.lua, which modules/utils/keymap.lua's
-- `replace()` can't actually walk (it indexes by string "mode|lhs" keys, not
-- list positions).
local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_callback = bind.map_callback

return {
	-- Plugin: auto-session (replaces persisted.nvim)
	["n|<leader>ss"] = map_cu("SessionSave"):with_noremap():with_silent():with_desc("session: Save"),
	["n|<leader>sl"] = map_cu("SessionRestore"):with_noremap():with_silent():with_desc("session: Restore current"),
	["n|<leader>sd"] = map_cu("SessionDelete"):with_noremap():with_silent():with_desc("session: Delete"),
	["n|<leader>sn"] = map_callback(function()
			vim.ui.input({ prompt = "Session name: " }, function(name)
				if name and name ~= "" then
					vim.cmd("SessionSave " .. name)
				end
			end)
		end)
		:with_noremap()
		:with_silent()
		:with_desc("session: Save named"),
	["n|<leader>sf"] = map_cr("Telescope session-lens search_session")
		:with_noremap()
		:with_silent()
		:with_desc("session: Find (Telescope)"),
}
