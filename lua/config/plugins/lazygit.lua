local plugin = {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>tg", "<cmd>LazyGit<cr>", desc = "Lazygit" },
    }
}

return plugin;
