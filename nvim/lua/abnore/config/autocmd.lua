local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

return {
    -- Highlight on yank, borrowed from ThePrimeageanaea
    autocmd("TextYankPost", {
        group = augroup("abnore", {}),
        callback = function()
            vim.highlight.on_yank({})
        end,
    }),

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
            vim.opt_local.formatoptions:remove("o")
            vim.opt_local.formatoptions:append("r")
        end,
    }),

    -- Enable `gf` for C system headers on macOS by mirroring Clang include paths
    vim.api.nvim_create_autocmd("FileType", {
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
    }),
}
