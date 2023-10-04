local flutter = {
    "akinsho/flutter-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
        require("flutter-tools").setup {}
        require("config.plugins.telescope").load_extension("flutter")
    end
}

return flutter
