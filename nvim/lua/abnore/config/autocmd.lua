local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("andrebn", { clear = true })

-- Highlight on yank, borrowed from ThePrimeageanaea
autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank({})
    end,
})

-- continues comments on enter, prevents comment-mode on o
autocmd("FileType", {
    group = group,
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove("o")
        vim.opt_local.formatoptions:append("r")
    end,
})

-- Removes trailing whitespace on save, but only for these filetypes
autocmd("BufWritePre", {
    group = group,
    pattern = { "*.c", "*.h", "*.md", "*.lua", "*.py", "*.sh", "*.s", "*.S" },
    callback = function()
        vim.cmd("silent! %s/\\s\\+$//e")
    end,
})

-- Enable `gf` for C system headers on macOS by mirroring Clang include paths
autocmd("FileType", {
    group = group,
    pattern = { "c", "cpp", "objc", "objcpp" },
    callback = function()
        local sdk = vim.fn.system("xcrun --show-sdk-path"):gsub("\n", "")
        local clang = vim.fn.system("clang -print-resource-dir"):gsub("\n", "")

        vim.opt_local.path:append({
            sdk .. "/usr/include",
            clang .. "/include",
            "/usr/local/include",
            "/opt/homebrew/include",
        })
    end,
})
