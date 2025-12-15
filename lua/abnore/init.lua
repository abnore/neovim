require("abnore.config")
require("abnore.lazy_init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local abnoreGroup = augroup("abnore", {})

-- Highlight on yank
autocmd("TextYankPost", {
    group = abnoreGroup,
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- Ensure Tree-sitter for C/C++
autocmd("FileType", {
    group = abnoreGroup,
    pattern = { "c", "cpp" },
    callback = function(args)
        if not vim.treesitter.highlighter.active[args.buf] then
            vim.treesitter.start(args.buf)
        end
    end,
})

-- Filetype-based colorscheme
--autocmd("FileType", {
--    group = abnoreGroup,
--    callback = function()
--        if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
--            pcall(vim.cmd.colorscheme, "tokyonight-night")
--        else
--            pcall(vim.cmd.colorscheme, "rose-pine-moon")
--        end
--    end,
--})

-- netrw tweaks
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
