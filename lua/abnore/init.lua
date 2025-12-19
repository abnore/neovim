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
    change_detection = { notify = false }
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

vim.filetype.add {
  extension = {
    h = "c",
    scheme = "scheme",
  },
}
-- Manually set global colorscheme
vim.cmd.colorscheme("catppuccin")
