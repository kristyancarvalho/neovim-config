return {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
        local notify = require("notify")

        notify.setup {
            stages = "fade_in_slide_out",
            timeout = 3000,
            max_width = 60,
            max_height = 10,
            background_colour = "#1e1e2e",
            render = "default",
            fps = 60,
            icons = {
                ERROR = "",
                WARN  = "",
                INFO  = "",
                DEBUG = "",
                TRACE = "✎",
            },
        }

        vim.notify = notify
    end,
}
