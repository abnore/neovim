return {
    {
        "folke/tokyonight.nvim",
        priority = 999,
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
        end
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false, -- Main Colorscheme cant be lazy loaded
        priority = 1000,
        auto_integrations = true,

        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
            })
        end,
    }
   
}
