local config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
        dashboard.button("<space> e", "Open file viewer"),
        dashboard.button("<space> ff", "Find file"),
        dashboard.button("<space> fr", "Recent files"),
        dashboard.button("q", "Quit", ":qa<cr>")
    }

    -- Lazy.nvim stats in footer
    vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
            local stats = require("lazy").stats()
            local count = (math.floor(stats.startuptime * 100) / 100)
            dashboard.section.footer.val = {
                -- "",
                stats.loaded .. " plugins loaded in " .. count .. " ms"
            }
             pcall(vim.cmd.AlphaRedraw)
        end
    })

    alpha.setup(dashboard.config)
end

local plugin = {
    "goolord/alpha-nvim",
    config = config,
}

return plugin
