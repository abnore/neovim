-- Using Oil, so disabling netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.confirm = true
vim.opt.guicursor = "n-v-c:block,i:ver25,r-cr-o:block"
vim.opt.termguicolors = true
vim.opt.isfname:append("@-@")
vim.opt.splitbelow = true
vim.opt.helpheight = 15
vim.opt.equalalways = false

vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = { 85 }

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/dev/dotfiles/nvim/undo")
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.updatetime = 50
vim.opt.timeoutlen = 200     -- leader keys: fast
vim.opt.ttimeoutlen = 10    -- terminal keys: instant

vim.filetype.add { extension = { h = "c", } }
vim.opt.list = false
vim.opt.listchars = {
    tab = "• ",
    trail = "•",
    extends = "»",
    precedes = "«",
}
