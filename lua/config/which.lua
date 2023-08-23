-- [[ WHICH KEY MAPPINGS ]]
require("which-key").register({
    ["<leader>"] = {
        f = {
            name = "+find",
            f = { "<cmd>Telescope find_files<cr>", "Find file" },
            g = { "<cmd>Telescope live_grep<cr>", "Find text (live grep)" },
            b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
        },
        c = {
            name = "code",
            a = "Code actions",
            f = "Format",
			r = "Rename symbol",
        },
        d = {
            name = "diagnostics",
            o = "Open float",
        },
		g = {
			name = "+goto",
			D = "Declaration",
			d = "Definition",
			i = "Implementation",
			r = "References",
		},
		t = {
			name = "+tools",
			f = { "<cmd>Telescope flutter commands<cr>", "Flutter" },
		},
    },
})
