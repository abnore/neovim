require("abnore.config")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("abnore.lazy", {
    change_detection = { notify = false },
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
   
-- Highlight on yank, borrowed from ThePrimeageanaea
autocmd("TextYankPost", {
    group = augroup("abnore", {}),
    callback = function()
        vim.highlight.on_yank({})
    end,
})

-- Enable `gf` for C system headers on macOS by mirroring Clang include paths
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp" },
  callback = function()
    local sdk = vim.fn.system("xcrun --show-sdk-path"):gsub("\n", "")
    local clang = vim.fn.system("clang -print-resource-dir"):gsub("\n", "")

    vim.opt_local.path:append({
      sdk .. "/usr/include",
      clang .. "/include",
    })
  end,
})

vim.cmd.colorscheme("kanagawa")
