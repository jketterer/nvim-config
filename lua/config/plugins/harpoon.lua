local plugin = {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>th", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoon" },
        { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "mark file" },
        { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "next marked file" },
        { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "previous marked file" },
    }
}

return plugin;
