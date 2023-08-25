local telescope = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
        extensions = { "ui-select" }
    },
    config = function(_, opts)
        require("telescope").load_extension("ui-select")
        require("telescope").setup(opts)
    end,
}

return telescope
