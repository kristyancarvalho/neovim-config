return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
        local gray_fg = "#d0d0d0"
        local bg_dark = "#1f1f1f"
        local bg_darker = "#161616"

        local oxocarbon_theme = {
            normal = {
                a = { fg = bg_darker, bg = "#08bdba", gui = "bold" },
                b = { fg = gray_fg, bg = "#262626" },
                c = { fg = gray_fg, bg = bg_dark },
            },
            insert = {
                a = { fg = bg_darker, bg = "#3ddbd9", gui = "bold" },
            },
            visual = {
                a = { fg = bg_darker, bg = "#be95ff", gui = "bold" },
            },
            replace = {
                a = { fg = bg_darker, bg = "#ee5396", gui = "bold" },
            },
            command = {
                a = { fg = bg_darker, bg = "#ff7eb6", gui = "bold" },
            },
            inactive = {
                a = { fg = "#555555", bg = bg_darker },
                b = { fg = "#555555", bg = bg_darker },
                c = { fg = "#555555", bg = bg_darker },
            },
        }

        require("lualine").setup({
            options = {
                theme = oxocarbon_theme,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
                icons_enabled = true,
                disabled_filetypes = { "NvimTree", "TelescopePrompt" },
            },
            sections = {
                lualine_a = { { "mode", icon = "" } },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
