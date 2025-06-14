return {
    "romgrk/barbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufReadPre",
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        require("barbar").setup {
            animation = true,
            auto_hide = false,
            clickable = true,
            focus_on_close = "left",
            icons = {
                buffer_index = false,
                buffer_number = false,
                button = "",
                filetype = { enabled = true },
                separator = { left = "▎", right = "" },
                modified = { button = "●" },
                pinned = { button = "車", filename = true },
                gitsigns = {
                    added = { text = '+' },
                    changed = { text = '~' },
                    deleted = { text = '-' },
                },
            },
            sidebar_filetypes = {},
        }

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>", opts)
        vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>", opts)
        vim.keymap.set("n", "<A-H>", "<Cmd>BufferMovePrevious<CR>", opts)
        vim.keymap.set("n", "<A-L>", "<Cmd>BufferMoveNext<CR>", opts)
        vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
        for i = 1, 9 do
            vim.keymap.set("n", "<leader>" .. i, "<Cmd>BufferGoto " .. i .. "<CR>", opts)
        end
        vim.keymap.set("n", "<leader>$", "<Cmd>BufferLast<CR>", opts)
    end,
}
