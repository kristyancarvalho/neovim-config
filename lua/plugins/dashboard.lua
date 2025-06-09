return {
    "goolord/alpha-nvim",
    priority = 2000,
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local icons = require("utils.icons").icons
        local datetime = tonumber(os.date(" %H "))
        local stats = require("lazy").stats()
        local total_plugins = stats.count
        local get_header = require("utils.startpage-headers")

        local colors = {
            bg = "#161616",
            fg = "#ffffff",
            red = "#ff7575",
            green = "#75ffca",
            yellow = "#f9d479",
            blue = "#75a3ff",
            magenta = "#ff7dff",
            cyan = "#75ffff",
            comment = "#767676",
            black = "#262626",
            white = "#ebebeb",
            orange = "#ff9859",
            purple = "#c29eff",
        }

        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = colors.cyan })
        vim.api.nvim_set_hl(0, "DashboardButtons", { fg = colors.white })
        vim.api.nvim_set_hl(0, "DashboardShortcut", { fg = colors.blue })
        vim.api.nvim_set_hl(0, "DashboardFooter", { fg = colors.comment })
        vim.api.nvim_set_hl(0, "DashboardGreeting", { fg = colors.purple })

        dashboard.section.header.opts.hl = "DashboardHeader"
        dashboard.section.buttons.opts.hl = "DashboardButtons"
        dashboard.section.footer.opts.hl = "DashboardFooter"

        local function button(sc, txt, keybind, keybind_opts)
            local b = dashboard.button(sc, txt, keybind, keybind_opts)
            b.opts.hl = "DashboardButtons"
            b.opts.hl_shortcut = "DashboardShortcut"
            return b
        end

        dashboard.section.header.val = get_header(0, true)
        dashboard.section.buttons.val = {
            button("e", icons.ui.new_file .. " Novo Arquivo", ":ene <BAR> startinsert <CR>"),
            button("f", icons.ui.files .. " Encontrar Arquivos", ":Telescope find_files <CR>"),
            button("o", icons.ui.restore .. " Arquivos Recentes", "<cmd>Telescope oldfiles<cr>"),
            button("t", icons.kinds.nvchad.Text .. " Grep", ":Telescope live_grep <CR>"),
            button("c", " " .. " Config. Neovim", "<cmd>e ~/.config/nvim/ | cd %:p:h<cr>"),
            button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
            button("q", icons.ui.close .. " Sair", ":qa<CR>"),
        }

        local function footer()
            local footer_datetime = os.date("  %m-%d-%Y   %H:%M:%S")
            local version = vim.version()
            local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
            local value = footer_datetime .. "   Plugins " .. total_plugins .. nvim_version_info
            return value
        end

        local count = 0
        for _ in pairs(dashboard.section.header.val) do
            count = count + 1
        end
        local extraline = count - 14

        for _ = 1, extraline do
            table.insert(dashboard.section.header.val, 1, "")
        end

        dashboard.section.footer.val = footer()

        local function greeting()
            local mesg
            local username = os.getenv("USER") or os.getenv("USERNAME") or "User"
            if datetime >= 0 and datetime < 6 then
                mesg = "Dreaming..󰒲 󰒲 "
            elseif datetime >= 6 and datetime < 12 then
                mesg = "🌅 Hi " .. username .. ", Good Morning ☀️"
            elseif datetime >= 12 and datetime < 18 then
                mesg = "🌞 Hi " .. username .. ", Good Afternoon ☕️"
            elseif datetime >= 18 and datetime < 21 then
                mesg = "🌆 Hi " .. username .. ", Good Evening 🌙"
            else
                mesg = "Hi " .. username .. ", it's getting late, get some sleep 😴"
            end
            return mesg
        end

        local function capture(cmd, raw)
            local f = assert(io.popen(cmd, "r"))
            local s = assert(f:read("*a"))
            f:close()
            if raw then
                return s
            end
            s = string.gsub(s, "^%s+", "")
            s = string.gsub(s, "%s+$", "")
            s = string.gsub(s, "[\n\r]+", " ")
            return s
        end

        local function split(source, sep)
            local result, i = {}, 1
            while true do
                local a, b = source:find(sep)
                if not a then
                    break
                end
                local candidat = source:sub(1, a - 1)
                if candidat ~= "" then
                    result[i] = candidat
                end
                i = i + 1
                source = source:sub(b + 1)
            end
            if source ~= "" then
                result[i] = source
            end
            return result
        end

        local bottom_section = {
            type = "text",
            val = greeting,
            opts = {
                position = "center",
                hl = "DashboardGreeting",
            },
        }

        local opts = {
            layout = {
                { type = "padding", val = 1 },
                dashboard.section.header,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                { type = "padding", val = 1 },
                bottom_section,
                { type = "padding", val = 1 },
                dashboard.section.footer,
            },
            opts = {
                noautocmd = true,
            },
        }

        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                once = true,
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        alpha.setup(opts)

        vim.api.nvim_create_autocmd({ "User" }, {
            pattern = { "AlphaReady" },
            callback = function()
                vim.cmd([[ set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3 ]])
            end,
        })

        vim.api.nvim_create_augroup("vimrc_alpha", { clear = true })
        vim.api.nvim_create_autocmd({ "User" }, {
            group = "vimrc_alpha",
            pattern = "AlphaReady",
            callback = function()
                if vim.fn.executable("onefetch") == 1 then
                    local header = split(
                        capture(
                            [[onefetch 2>/dev/null | sed 's/\x1B[@A-Z\\\]^_]\|\x1B\[[0-9:;<=>?]*[-!"#$%&'"'"'()*+,.\/]*[][\\@A-Z^_`a-z{|}~]//g']],
                            true
                        ),
                        "\n"
                    )
                    if next(header) ~= nil then
                        require("alpha.themes.dashboard").section.header.val = header
                        require("alpha").redraw()
                    end
                end
            end,
            once = true,
        })
    end,
}
