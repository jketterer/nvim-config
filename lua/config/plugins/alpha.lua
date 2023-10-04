local config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
        dashboard.button("<SPC> e", "Open file viewer"),
        dashboard.button("<SPC> E", "Close file viewer")
    }

    alpha.setup(dashboard.config)
end

local plugin = {
    "goolord/alpha-nvim",
    config = config,
}

return plugin
