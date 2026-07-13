local leap = {
    -- leap moved off GitHub; the old ggandor/leap.nvim repo is a frozen stub
    -- that notifies (and crashes nvim-notify) on load.
    url = "https://codeberg.org/andyg/leap.nvim",
    dependencies = "tpope/vim-repeat",
    -- Map straight to leap's <Plug> targets. The old add_default_mappings()
    -- helper is deprecated and warns on every load (shows up via nvim-notify).
    keys = {
        { "s",  "<Plug>(leap-forward)",     mode = { "n", "x", "o" }, desc = "Leap forward to" },
        { "S",  "<Plug>(leap-backward)",    mode = { "n", "x", "o" }, desc = "Leap backwards to" },
        { "gs", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from window" },
    },
}

return leap
