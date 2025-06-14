return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
        local colors = {
            add = "#98c379",
            change = "#e5c07b",
            delete = "#e86671",
        }
        vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.add, bg = "NONE" })
        vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.change, bg = "NONE" })
        vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.delete, bg = "NONE" })

        require("gitsigns").setup {
            signs = {
                add          = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "" },
                change       = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "" },
                delete       = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "" },
                topdelete    = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "" },
                changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "" },
            },
            signcolumn = true,
            numhl = false,
            linehl = false,
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            current_line_blame = false,
            sign_priority = 6,
            update_debounce = 100,
            word_diff = false,
        }
    end,
}
