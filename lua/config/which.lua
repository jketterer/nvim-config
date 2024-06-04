-- [[ WHICH KEY MAPPINGS ]]
require("which-key").register({
    ["<leader>"] = {
        c = { name = "+code", },
        d = { name = "+diagnostics", },
        f = { name = "+find", },
        g = { name = "+goto", },
        t = {
            name = "+tools",
            l = { "<cmd>Lazy<cr>", "lazy.nvim" },
        },
        h = {
            name = "+harpoon",
        },
    },
})
