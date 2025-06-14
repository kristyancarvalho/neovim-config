return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            sort_by = "name",
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                group_empty = true,
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
            filters = {
                dotfiles = false,
                custom = { "^.git$" },
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            git = {
                enable = true,
                ignore = false,
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
        })

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", opts)
        vim.keymap.set("n", "<leader>o", "<Cmd>NvimTreeFocus<CR>", opts)
    end,
}