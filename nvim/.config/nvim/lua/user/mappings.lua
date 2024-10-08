-- Mapping data with "desc" stored directly by vim.keymap.set().
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
	-- first key is the mode
	n = {
		-- second key is the lefthand side of the map
		-- mappings seen under group name "Buffer"
		["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
		["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
		["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
		["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

		-- Open file in browser
		["<space>r"] = { ":exe ':silent !firefox %'<cr>", desc = "Run Browser" },

		-- View treesitter highlight groups
		["<space>k"] = { ":TSHighlightCapturesUnderCursor<cr>", desc = "View Highlight Group" },

		-- Unbinding Easy splits
		["\\"] = false,
		["|"] = false,

		-- -- Search highlight groups
		-- ["<space>sg"] = { "<cmd>Telescope highlights<cr>", desc = "Highlight groups" },

		-- quick save
		["<C-s>"] = { ":w!<cr>", desc = "Save File" },

		-- Zen mode
		["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },

		-- Manager Buffers
		["<tab>"] = {
			function()
				require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
			end,
			desc = "Next buffer",
		},
		["<S-tab>"] = {
			function()
				require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
			end,
			desc = "Previous buffer",
		},
	},
}
