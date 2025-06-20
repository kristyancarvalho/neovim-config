return {
    "xiyaowong/nvim-transparent",
    lazy = false,
    config = function()
      require("transparent").setup({
        extra_groups = {
          "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
          "Statement", "PreProc", "Type", "Underlined", "Todo", "String", "Function",
          "Conditional", "Repeat", "Operator", "Structure", "LineNr", "NonText",
          "SignColumn", "CursorLine", "CursorLineNr", "StatusLine", "StatusLineNC",
          "EndOfBuffer",
          "NormalFloat", "NvimTreeNormal", "TelescopeNormal"
        },
        exclude_groups = {},
      })
    end,
  }
  