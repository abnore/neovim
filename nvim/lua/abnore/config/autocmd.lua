local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("andrebn", { clear = true })

-- Use this for when nvim is set to the pager
autocmd("FileType", {
  pattern = "man",
  callback = function()
    local set = vim.api.nvim_set_hl

    -- Kanagawa-inspired palette
    local wave_red      = "#e46876"
    local crystal_blue  = "#7fb4ca"
    local spring_green  = "#98bb6c"
    local fuji_purple   = "#957fb8"
    local sumi_gray     = "#54546d"
    local fuji_white    = "#dcd7ba"

    set(0, "Normal", { fg = fuji_white })
    set(0, "manSectionHeading", { fg = wave_red, bold = true })
    set(0, "manSubHeading", { fg = crystal_blue, bold = true })
    set(0, "manOptionDesc", { fg = spring_green })
    set(0, "manBold", { bold = true }) -- no fg, everything is bold...
    set(0, "manItalic", { fg = fuji_purple, italic = true })
    set(0, "manUnderline", { fg = crystal_blue, underline = true })
  end,
})

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
-- Give me C-style syntax instead of norwegian in these filetypes
autocmd("FileType", {
    group = group,
    pattern = { "c", "cpp", "lua", "python", "sh", "asm" },
    callback = function()
        local opts = { buffer = true }

        vim.keymap.set("i", "å", "\\", opts)
        vim.keymap.set("i", "Å", "|",  opts)
        vim.keymap.set("i", "ø", "{",  opts)
        vim.keymap.set("i", "Ø", "[",  opts)
        vim.keymap.set("i", "æ", "}",  opts)
        vim.keymap.set("i", "Æ", "]",  opts)
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
-- This does not work from frameworks
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
