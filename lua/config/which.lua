-- [[ WHICH KEY MAPPINGS ]]
require("which-key").register({
	["<leader>"] = {
		f = {
			name = "+find",
			f = { "<cmd>Telescope find_files<cr>", "Find file" },
			g = { "<cmd>Telescope live_grep<cr>", "Find text (live grep)" },
			b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
		},
	},
})
