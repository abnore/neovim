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


                -- Telescope (explicit, clean)
                {
                    name = "Find files",
                    action = "Telescope find_files",
                    section = "Search",
                },
                {
                    name = "Find text",
                    action = "Telescope live_grep",
                    section = "Search",
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
                {
                    name = "TODO",
                    action = "Telescope grep_string search=TODO",
                    section = "Tasks",
                },
            },

            content_hooks = {
                starter.gen_hook.adding_bullet("░ "),
                starter.gen_hook.indexing("section",
                            { "Builtin actions", "Search", "Dotfiles", "Tasks" }),
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
     
        local mocha = require("catppuccin.palettes").get_palette "mocha"
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(0, "MiniStarterHeader", {
                    fg = mocha.red,
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
