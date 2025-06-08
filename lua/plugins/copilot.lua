return {
    {
        'zbirenbaum/copilot.lua',
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<Tab>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                panel = { enabled = false },
            })

            vim.cmd [[
        highlight CopilotSuggestion guifg=#555555 ctermfg=8
      ]]
        end,
    }
}
