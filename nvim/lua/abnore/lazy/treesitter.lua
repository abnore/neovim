return
{
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "vimdoc", --"asm",-- using local
                "javascript", "typescript", "c", "cpp",
                "lua", "rust", "jsdoc", "bash", "go", "python", "make"
            }):wait(3000)

            -- Explicit per-buffer activation (REQUIRED in modern Neovim)
            local group = vim.api.nvim_create_augroup("TreesitterAttach", {})

            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                callback = function(args)
                    -- Highlighting & injections (Neovim)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            enable = true,
            multiwindow = false,
            max_lines = 0,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = "outer",
            mode = "cursor",
            separator = nil,
            zindex = 20,
            on_attach = nil,
        }
    },
}
