return
{
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,

    opts = {
        columns = { "icon", "permissions", "size", },
        skip_confirm_for_simple_edits = true, -- No point on simple edit
        prompt_save_on_select_new_entry = false,
        float = {
            padding = 2,
            max_width = 0.8,
            max_height = 0.9,
            border = "double",
            win_options = {
                winblend = 10,
            },
            preview_split = "below",
        },

        preview_win = {
            update_on_cursor_moved = true,
            preview_method = "fast_scratch",
        },
    }
}
