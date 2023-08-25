local comment = {
    "terrortylor/nvim-comment",
    keys = {
        { "<C-/>",   "<cmd>CommentToggle<cr>" },
        { "<C-S-/>", "<cmd>CommentToggle<cr>j" },
        { "<C-/>",   "<C-\\><C-N><cmd>CommentToggle<cr>i",  mode = { "i" } },
        { "<C-S-/>", "<C-\\><C-N><cmd>CommentToggle<cr>ji", mode = { "i" } },
    },
    main = "nvim_comment",
    config = true,
}

return comment
