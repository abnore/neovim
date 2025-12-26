vim.opt.guicursor = "n-v-c:block,i:ver25,r-cr-o:block"

-- Using Oil, so disabling netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.cmd("filetype plugin indent on")
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "85"

vim.opt.list = false
vim.opt.listchars = {
  tab = "• ",
  trail = "•",
  extends = "»",
  precedes = "«",
}
vim.filetype.add {
  extension = {
    h = "c",
  },
}
