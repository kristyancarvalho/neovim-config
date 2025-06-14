return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup {
            options = {
                mode = "buffers",
                numbers = "ordinal",
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                indicator = { style = "icon" },
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                separator_style = "slant",
                diagnostics = "nvim_lsp",
                hover = { enabled = true, delay = 200, reveal = { "close" } },
            },
        }
    end,
}
