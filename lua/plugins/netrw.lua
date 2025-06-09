return {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
        vim.g.netrw_liststyle = 3
        vim.g.netrw_altv = 1
        vim.g.netrw_banner = 0
        vim.g.netrw_winsize = 25
        vim.g.netrw_list_hide = '^\\..*'
        vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

        require('nvim-web-devicons').setup({ default = true })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "netrw",
            callback = function()
                vim.opt_local.statuscolumn = ""
                vim.opt_local.winbar = "󰉋  Explorador de Arquivos (Netrw)"

                vim.cmd("syntax match NetrwHeritageLine /│/")
                vim.cmd("hi! link NetrwHeritageLine Comment")
                vim.cmd("hi! netrwDir guifg=#78a9ff")
                vim.cmd("hi! netrwClassify guifg=#ee5396")
                vim.cmd("hi! netrwExe guifg=#3ddbd9")
                vim.cmd("hi! netrwSymLink guifg=#08bdba")
                vim.cmd("hi! netrwComment guifg=#6f6f6f")
            end,
        })
    end
}
