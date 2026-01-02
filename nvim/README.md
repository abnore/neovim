# Neovim Configuration

Minimal Lua-based Neovim configuration using `lazy.nvim`.
Focused on core editing and navigation

---

## Overview

This setup replaces an older Vimscript configuration with a modular Lua layout.
Only plugins that were actively used are included, and I will build a simpler
design starting with this base.

---

## Structure

```text
~/.config/nvim
├── init.lua
├── lazy-lock.json
└── lua/abnore
    ├── init.lua
    ├── config
    │   ├── init.lua
    │   ├── set.lua
    │   ├── autocmd.lua
    │   ├── lazy.lua
    │   └── remap.lua
    └── lazy
        ├── airline.lua
        ├── mini-starter.lua
        ├── mini-pick.lua
        ├── present.lua
        ├── treesitter.lua
        ├── cellular_automaton.lua
        ├── oil.lua
        ├── render-markdown.lua
        ├── vim-tmux-navigator.lua
        └── colors.lua
```

---

## Plugins

### Core
- `lazy.nvim`

### Navigation
- `mini-pick`
- `oil.nvim`
- `vim-tmux-navigator`

### Syntax
- `nvim-treesitter`
- `nvim-treesitter-context`

### UI
- `vim-airline`
- `vim-airline-themes`
- `nvim-web-devicons`
- `mini.starter`
- `present.nvim`
- `render-markdown.nvim`

### Funny
- `cellular-automaton.nvim`

---

## Tree-sitter

Tree-sitter will **no longer** auto install languages.
first install the cli tool to get the parsers.

>[!NOTE]
> The Tree-sitter API changed in a recent update:
> `configs` was renamed to `config`. This is a breaking change and requires
> manual adjustment.

```sh
brew install tree-sitter-cli
```

An autocmd will therefore need to be written that starts treesitter
on `FileType` and languages will need to be written in if you want syntax for them

Languages configured:
- c, cpp, cs
- lua
- bash, zsh
- go
- rust
- javascript
- vimdoc
- markdown
- python

---

## Keybindings (Selected)

### General
- `-` — open Oil

### Pick
- `<leader><leader>` — find files
- `<leader>gf` — git files
- `<leader>b` — buffers

### Editing
- `J` / `K` (visual) — move selected lines
- `J` (normal) — join lines without moving cursor
- `<C-d>` / `<C-u>` — centered scrolling
- `<leader>d` — delete without yanking
- `<leader>p` — paste without overwriting register

### tmux
- `<C-h/j/k/l>` — move between tmux and Neovim panes

Custom configured theme

---

## Statusline

Uses `vim-airline` with powerline fonts enabled.

Themes in use:
- `angr`
- `minimalist`

---

## Installation

```sh
git clone https://github.com/abnore/neovim ~/.config/nvim
```

Start Neovim. Install tree-sitter-cli
Plugins install automatically via lazy.nvim.

---

## Requirements

- Neovim 0.11+
- Git
- Nerd Font (for airline icons)
- Optional:
  - ripgrep
  - tmux
