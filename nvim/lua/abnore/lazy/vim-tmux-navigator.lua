return
{
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
        vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
        { "<C-h>", "<Cmd>TmuxNavigateLeft<CR>",  silent = true },
        { "<C-j>", "<Cmd>TmuxNavigateDown<CR>",  silent = true },
    },
}
