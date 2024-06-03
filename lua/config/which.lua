-- [[ WHICH KEY MAPPINGS ]]
require("which-key").register({
    K = "LSP Hover",
    ["<C-k>"] = "LSP Signature Help",
	g = {
		name = "+goto",
		d = "Go to definition",
		D = "Go to declaration",
		m = "Go to implementation",
		r = "Go to references",
	},
    ["<leader>"] = {
        f = {
            name = "+find",
            b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
            f = { "<cmd>Telescope find_files<cr>", "Find file" },
            g = { "<cmd>Telescope live_grep<cr>", "Find text (ripgrep)" },
        },
        c = {
            name = "code",
            a = "Code actions",
            f = "Format",
			r = "Rename symbol",
        },
        d = {
            name = "diagnostics",
            l = "Goto previous",
            n = "Goto next",
            o = "Open float",
        },
		t = {
			name = "+tools",
            l = { "<cmd>Lazy<cr>", "lazy.nvim" },
		},
        h = {
            name = "+harpoon",
        },
    },
})
