local leap = {
    "ggandor/leap.nvim",
    dependencies = "tpope/vim-repeat",
    keys = {
        { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
        { "S",  mode = { "n", "x", "o" }, desc = "Leap backwards to" },
        { "gs", mode = { "n", "x", "o" }, desc = "Leap from window" },
    },
    config = function()
        require("leap").add_default_mappings(true)
    end,
}

return leap;
