return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
            -- vim.cmd.colorscheme("tokyonight-night")
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = false,
                styles = {
                    italic = false,
                },
            })
        end
    },

    { 
        "catppuccin/nvim", 
        name = "catppuccin",
        priority = 1000 ,
        config = function()
            require("catppuccin").setup({})
        vim.cmd.colorscheme("catppuccin")
        end,
    },

}
