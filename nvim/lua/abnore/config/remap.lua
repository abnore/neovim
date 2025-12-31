-- Leader
vim.g.mapleader = " "

-- Special characters
vim.keymap.set("i", "å", "\\")
vim.keymap.set("i", "Å", "|")
vim.keymap.set("i", "ø", "{")
vim.keymap.set("i", "Ø", "[")
vim.keymap.set("i", "æ", "}")
vim.keymap.set("i", "Æ", "]")

-- Insert-mode escape
vim.keymap.set("i", "<C-c>", "<Esc>")
-- Remove highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Saving and exiting
vim.keymap.set( "n", "<leader>w", vim.cmd.w, { desc = "Save file"})
vim.keymap.set( "n", "<leader>q", vim.cmd.q, { desc = "Quit nvim"})

-- File / navigation
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open parent directory" })

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Join lines without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank to system clipboard and paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>p", [["+p]])
-- Paste in visual mode, overwrite without overwriting register
vim.keymap.set("v", "<leader>p", [["_dP]])

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "d", [["_d]])
vim.keymap.set("n", "dd", [["_dd]])

-- Quickfix & location list navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect"})
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect"})

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Insert brackets and paranthesis and move inside them
vim.keymap.set("i", "<C-b>", "{}<Left><CR><ESC>O", { silent = true })
vim.keymap.set("i", "<C-k>", "()<Left>", { silent = true })

-- Search & replace word under cursor
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)

vim.keymap.set("n", "<leader>tl", function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = "Toggle list / trailing whitespace" })


-- Cellular automaton (fun, harmless)
vim.keymap.set("n", "<leader>ca", function()
  require("cellular-automaton").start_animation("make_it_rain")
end)


-- ================
-- Pick Mapping
vim.keymap.set("n", "<leader><leader>", function()
  MiniPick.builtin.files()
end, { desc = "Pick files (all)" })

vim.keymap.set("n", "<leader>gf", function()
  MiniPick.builtin.files({ tool = "git" })
end, { desc = "Pick git files" })

vim.keymap.set("n", "<leader>b", function()
  MiniPick.builtin.buffers()
end, { desc = "Pick buffers" })

-- ================
-- Present mappings
vim.keymap.set("n", "<leader>pp", function()
  require("present").start_presentation()
end, { desc = "Start presentation" })


-- ================
-- Markdown mappings
vim.keymap.set("n", "<leader>mk", function()
    if vim.bo.filetype ~= "markdown" then
        return
    end

    require("render-markdown").buf_toggle()

    if vim.o.signcolumn == "yes:1" then
        vim.o.signcolumn = "auto"
    else
        vim.o.signcolumn = "yes:1"
    end
end, { desc = "Toggle markdown" })
