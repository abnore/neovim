# Vim Configuration README

## Overview
This document describes a custom Neovim configuration designed to enhance workflow, productivity, and ease of navigation. It includes settings for indentation, UI, plugin management, key mappings, and more.

## Features

### General Settings
- **Line Numbering**: Enables both absolute (`set number`) and relative numbering (`set relativenumber`) for easier navigation.
- **Indentation**: Smart indentation is enabled (`set smartindent`). Tab width is set *per file type*:
  - Python, C, C++, ASM, Objective-C → 4 spaces
  - VHDL → 2 spaces
- **Scrolling**: Keeps 8 lines visible above and below the cursor when scrolling (`set scrolloff=8`).
- **Mouse Support**: Enables full mouse support (`set mouse=a`).
- **Search Behavior**:
  - Disables persistent search highlight (`set nohls`)
  - Enables incremental search (`set incsearch`)
- **Persistent Undo**: Enabled with undo files stored in `~/.config/nvim/undo`
- **Clipboard Integration**:
  - macOS/Windows: Uses system clipboard via `unnamedplus`
  - Linux: Uses `xclip`/`xsel` if available, or falls back to `unnamed`
- **Performance**:
  - Lazy redraw for better performance (`set lazyredraw`)
  - Faster update time (`set updatetime=300`)
- **Trailing Whitespace**: Automatically removed on save

## Plugin Management

Uses [`vim-plug`](https://github.com/junegunn/vim-plug) for plugin management.

### Plugins

#### UI & Appearance
- `tokyonight.nvim`: Clean modern theme (`colorscheme tokyonight-night`)
- `vim-airline`: Status bar
- `nvim-web-devicons`: Developer file icons
- `vim-css-color`: CSS color preview
- `awesome-vim-colorschemes`: Additional retro color themes
- `oil.nvim`: Minimalistic file explorer

#### Navigation & Productivity
- `NERDTree`: File explorer sidebar
- `tagbar`: Code navigation with ctags
- `telescope.nvim`: Powerful fuzzy finder
- `vim-tmux-navigator`: Seamless navigation between Vim and tmux
- `vim-visual-multi`: Multi-cursor editing

#### Syntax & Language Support
- `nvim-treesitter`: Syntax highlighting and parsing
- `nvim-treesitter-context`: Sticky code context window
- `vimtex`: LaTeX support
- `plenary.nvim`: Required for Telescope and other Lua plugins

#### Plugin Setup Commands
```vim
:PlugInstall        " Install plugins
:PlugClean          " Remove unused plugins
:UpdateRemotePlugins
```
## Lua Configuration

### Treesitter
Treesitter is configured to automatically install and highlight support for:
- `javascript`, `typescript`, `lua`, `vim`, `objc`, `json`, `html`, `rust`, `c`, `python`, `markdown`

### Telescope
Telescope includes fuzzy finding for files, buffers, git history, help tags, and more. It is configured to:
- Use a dropdown theme for file search
- Enable live preview when scrolling through colorschemes

### Oil.nvim
A lightweight file explorer:
- Shows hidden files
- Displays icons using `nvim-web-devicons`

### Treesitter Context
Displays the current function, class, or block at the top of your window while scrolling. It includes:
- Cursor-based context tracking
- Optional line limit
- Optional z-index and trimming behavior

---

## Key Mappings

### File Navigation
- `<C-f>`: Focus NERDTree
- `<C-t>`: Toggle NERDTree
- `<F8>`: Toggle Tagbar

### Telescope
- `<leader><leader>`: Find files
- `<leader>fg`: Live grep
- `<leader>fb`: List buffers
- `<leader>fh`: Help tags
- `<leader>gf`: Git files
- `<leader>gc`: Git commits
- `<leader>of`: Recently opened files

### Editing Enhancements
- `J`: Joins lines while keeping the cursor in place
- `dd`: Deletes a line **without** yanking it
- Visual `J` / `K`: Moves selected lines down/up
- `<C-d>`, `<C-u>`: Scroll half-page and center the cursor
- `n`, `N`: Center the screen when jumping to search results
- `<C-b>`: Insert `{}` with newline in insert mode
- `<C-k>`: Insert `()` in insert mode

### Special Character Mappings
Insert-mode mappings for fast symbol input:
- `æ`: `}`
- `Æ`: `]`
- `ø`: `{`
- `Ø`: `[`
- `Å`: `|`
- `å`: `\`

### Commenting
- `<leader>co`: Toggle `//` comments on selected lines (visual mode)

### Misc
- `<leader>so`: Save and reload `init.vim`
- `<leader>w`: Save file
- `<leader>q`: Quit

---

## Color Scheme

- Default theme: `tokyonight-night`

---

## Installation & Setup

1. **Install vim-plug**:
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. **Copy the configuration** into your Neovim config directory:
```sh
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim
```
3. **Launch Neovim** and install plugins:
```sh
:PlugInstall
```
4. **Restart Neovim** and apply all changes


## Notes

- **Built for Neovim**, not legacy Vim
- **Lua-based plugins** require Neovim **0.5+**
- Some plugins may need external tools:
  - `xclip` or `xsel` for clipboard support on Linux
  - `ctags` for Tagbar navigation
