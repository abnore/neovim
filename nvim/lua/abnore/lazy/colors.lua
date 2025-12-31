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
}
