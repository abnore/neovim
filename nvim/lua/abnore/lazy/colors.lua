return {
    {
        "folke/tokyonight.nvim", opts = {
            style = "night",
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = false },
                sidebars = "dark",
                floats = "dark",
            },
        }
    },

    {
        "rebelot/kanagawa.nvim", opts = { compile = true },
        build = ":KanagawaCompile",
    },

    {
        "catppuccin/nvim", opts = {
            flavour = "mocha",
            color_overrides = {
                mocha = {
                    red = "#ff5f5f", -- desert red
                },
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
        },
        name = "catppuccin",
        lazy = false, -- Main Colorscheme cant be lazy loaded
        auto_integrations = true,
    }
}
