-- Config for rmagatti/auto-session, replacing olimorris/persisted.nvim.
-- See lua/user/plugins/auto-session.lua for why.
return function()
	require("auto-session").setup({
		-- Sessions are loaded manually via <leader>sl / session-lens, not on VimEnter.
		auto_restore = false,
		-- Key sessions by cwd + git branch, same as the old persisted.nvim setup.
		use_git_branch = true,
		session_lens = {
			load_on_setup = true,
		},
	})
end
