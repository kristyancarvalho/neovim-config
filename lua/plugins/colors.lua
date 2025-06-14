return {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    priority = 1000,
    lazy = false,
    config = function()
        vim.cmd.colorscheme "oxocarbon"
        vim.cmd [[
            highlight Normal guibg=NONE ctermbg=NONE
            highlight NormalNC guibg=NONE ctermbg=NONE
            highlight EndOfBuffer guibg=NONE ctermbg=NONE
            highlight LineNr guibg=NONE ctermbg=NONE
            highlight SignColumn guibg=NONE ctermbg=NONE
        ]]
    end,
}
