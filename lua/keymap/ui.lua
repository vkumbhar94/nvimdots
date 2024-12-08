local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local builtin_map = {
	-- Builtin: buffer
	["n|<leader>bn"] = map_cu("enew"):with_noremap():with_silent():with_desc("buffer: New"),

	-- Builtin: terminal
	["t|<C-w>h"] = map_cmd("<Cmd>wincmd h<CR>"):with_silent():with_noremap():with_desc("window: Focus left"),
	["t|<C-w>l"] = map_cmd("<Cmd>wincmd l<CR>"):with_silent():with_noremap():with_desc("window: Focus right"),
	["t|<C-w>j"] = map_cmd("<Cmd>wincmd j<CR>"):with_silent():with_noremap():with_desc("window: Focus down"),
	["t|<C-w>k"] = map_cmd("<Cmd>wincmd k<CR>"):with_silent():with_noremap():with_desc("window: Focus up"),

	-- Builtin: tab
	["n|tn"] = map_cr("tabnew"):with_noremap():with_silent():with_desc("tab: Create a new tab"),
	["n|tk"] = map_cr("tabnext"):with_noremap():with_silent():with_desc("tab: Move to next tab"),
	["n|tj"] = map_cr("tabprevious"):with_noremap():with_silent():with_desc("tab: Move to previous tab"),
	["n|to"] = map_cr("tabonly"):with_noremap():with_silent():with_desc("tab: Only keep current tab"),
}

bind.nvim_load_mapping(builtin_map)

local plug_map = {
	-- Plugin: nvim-bufdel
	["n|<A-q>"] = map_cr("BufDel"):with_noremap():with_silent():with_desc("buffer: Close current"),

	-- Plugin: bufferline.nvim
	["n|<C-S-o>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("buffer: Switch to next"),
	["n|<C-S-i>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent():with_desc("buffer: Switch to prev"),
	["n|<A-S-i>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent():with_desc("buffer: Move current to next"),
	["n|<A-S-o>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent():with_desc("buffer: Move current to prev"),
	["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap():with_desc("buffer: Sort by extension"),
	["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap():with_desc("buffer: Sort by directory"),
	["n|<C-S-1>"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent():with_desc("buffer: Goto buffer 1"),
	["n|<C-S-2>"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent():with_desc("buffer: Goto buffer 2"),
	["n|<C-S-3>"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent():with_desc("buffer: Goto buffer 3"),
	["n|<C-S-4>"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent():with_desc("buffer: Goto buffer 4"),
	["n|<C-S-5>"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent():with_desc("buffer: Goto buffer 5"),
	["n|<C-S-6>"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent():with_desc("buffer: Goto buffer 6"),
	["n|<C-S-7>"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent():with_desc("buffer: Goto buffer 7"),
	["n|<C-S-8>"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent():with_desc("buffer: Goto buffer 8"),
	["n|<C-S-9>"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent():with_desc("buffer: Goto buffer 9"),
}

bind.nvim_load_mapping(plug_map)

local mapping = {}

function mapping.gitsigns(buf)
	local actions = require("gitsigns.actions")
	local map = {
		["n|]g"] = bind.map_callback(function()
			if vim.wo.diff then
				return "]g"
			end
			vim.schedule(function()
				actions.next_hunk()
			end)
			return "<Ignore>"
		end)
			:with_buffer(buf)
			:with_expr()
			:with_desc("git: Goto next hunk"),
		["n|[g"] = bind.map_callback(function()
			if vim.wo.diff then
				return "[g"
			end
			vim.schedule(function()
				actions.prev_hunk()
			end)
			return "<Ignore>"
		end)
			:with_buffer(buf)
			:with_expr()
			:with_desc("git: Goto prev hunk"),
		["n|<leader>gs"] = bind.map_callback(function()
			actions.stage_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Stage hunk"),
		["v|<leader>gs"] = bind.map_callback(function()
			actions.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
			:with_buffer(buf)
			:with_desc("git: Stage hunk"),
		["n|<leader>gu"] = bind.map_callback(function()
			actions.undo_stage_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Undo stage hunk"),
		["n|<leader>gr"] = bind.map_callback(function()
			actions.reset_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Reset hunk"),
		["v|<leader>gr"] = bind.map_callback(function()
			actions.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
			:with_buffer(buf)
			:with_desc("git: Reset hunk"),
		["n|<leader>gR"] = bind.map_callback(function()
			actions.reset_buffer()
		end)
			:with_buffer(buf)
			:with_desc("git: Reset buffer"),
		["n|<leader>gp"] = bind.map_callback(function()
			actions.preview_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Preview hunk"),
		["n|<leader>gb"] = bind.map_callback(function()
			actions.blame_line({ full = true })
		end)
			:with_buffer(buf)
			:with_desc("git: Blame line"),
		-- Text objects
		["ox|ih"] = bind.map_callback(function()
			actions.text_object()
		end):with_buffer(buf),
	}
	bind.nvim_load_mapping(map)
end

return mapping
