local comment = {
    "terrortylor/nvim-comment",
    keys = {
        { "<C-/>",   "<cmd>CommentToggle<cr>j" },
        { "<C-S-/>", "<cmd>CommentToggle<cr>" },
        { "<C-/>",   "<C-\\><C-N><cmd>CommentToggle<cr>ji",  mode = { "i" } },
        { "<C-S-/>", "<C-\\><C-N><cmd>CommentToggle<cr>i", mode = { "i" } },
    },
    main = "nvim_comment",
    config = true,
}

return comment
