return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
        require('telescope').setup {
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
             find_files = {
                 theme = "ivy",
             },
             git_files = {
                 theme = "ivy",
             }
         },
            extensions={
                fzf = {}
            }
        }
        require('telescope').load_extension('fzf')
    end
}
