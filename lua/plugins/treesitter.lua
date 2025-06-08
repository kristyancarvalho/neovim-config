return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config  = function ()
	local configs  = require("nvim-treesitter.configs")
	configs.setup({
	    highlight = {
		enable = true,
	    },
	    indent = { enable = true },
	    autotage = { enable = true },
	    ensure_installed = {
		"typescript",
		"tsx",
		"javascript",
		"vim",
		"vimdoc",
		"go",
		"gomod",
		"html",
		"css",
		"json",
		"yaml",
		"prisma",
		"bash",
		"python"
	    },
	    auto_install = false,
	}) 
    end
}
