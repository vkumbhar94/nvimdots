-- Disables upstream's olimorris/persisted.nvim in favor of rmagatti/auto-session
-- (see lua/user/plugins/auto-session.lua). Using `disabled_plugins` instead of
-- deleting the spec in lua/modules/plugins/editor.lua keeps `git pull` from
-- upstream ayamir/nvimdots clean, and reverting is just removing this line.
return {
	disabled_plugins = { "olimorris/persisted.nvim" },
}
