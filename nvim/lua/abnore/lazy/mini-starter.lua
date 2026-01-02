return {
    "echasnovski/mini.starter",
    config = function()
       local starter = require("mini.starter")

        starter.setup({
            evaluate_single = true,
            header = [[
            _|      _|  _|      _|  _|_|_|  _|      _|
            _|_|    _|  _|      _|    _|    _|_|  _|_|
            _|  _|  _|  _|      _|    _|    _|  _|  _|
            _|    _|_|    _|  _|      _|    _|      _|
            _|      _|      _|      _|_|_|  _|      _|
            ]],

            items = {
                -- Built-in
                starter.sections.builtin_actions(),

                -- Files
                starter.sections.recent_files(3, false),
                starter.sections.recent_files(3, true),


                -- Pick (explicit, clean)
                {
                    name = "Files",
                    action = function()
                        require("mini.pick").builtin.files()
                    end,
                    section = "Pick",
                },
                {
                    name = "Text",
                    action = function()
                        require("mini.pick").builtin.grep_live()
                    end,
                    section = "Pick",
                },
                -- Project / Neovim
                {
                    name = "Tmux config",
                    action = function()
                        require("oil").open("~/.config/tmux")
                    end,
                    section = "Dotfiles",
                },
                {
                    name = "Neovim config",
                    action = function()
                        require("oil").open("~/.config/nvim/lua/abnore")
                    end,
                    section = "Dotfiles",
                },
            },

            content_hooks = {
                starter.gen_hook.adding_bullet("░ "),
                starter.gen_hook.indexing("section",
                            { "Builtin actions", "Pick", "Dotfiles" }),
                starter.gen_hook.aligning("center", "center"),
                starter.gen_hook.padding(0, 2),
            },

            footer = function()
                local ok, out = pcall(vim.fn.system, "fortune -s")
                if ok and type(out) == "string" and out ~= "" then
                    return out:gsub("\n$", "")
                end
                return ""
            end,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(0, "MiniStarterHeader", {
                    fg = "#ff5f5f", -- desert red
                    bold = false,
                })
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "MiniStarterOpened",
            once = true,
            callback = function()
                vim.opt.laststatus = 0
            end,
        })
        vim.api.nvim_create_autocmd("BufLeave", {
            callback = function(ev)
                if vim.bo[ev.buf].filetype == "ministarter" then
                    vim.opt.laststatus = 2
                end
            end,
        })
    end,
}
