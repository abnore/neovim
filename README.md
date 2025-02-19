# Vim Configuration README

## Overview
This document describes a custom Vim configuration designed to enhance workflow, productivity, and ease of navigation. It includes settings for indentation, syntax highlighting, UI enhancements, plugin management, key mappings, and additional quality-of-life features.

## Features

### General Settings
- **Line Numbering**: Enables both absolute (`set number`) and relative numbering (`set relativenumber`) for easier navigation.
- **Indentation**: Uses smart indentation (`set smartindent`) and a tab width of 8 spaces (`set tabstop=8`, `set shiftwidth=8`, `set softtabstop=8`, `set expandtab`).
- **Scrolling Behavior**: Keeps 8 lines visible above and below the cursor when scrolling (`set scrolloff=8`).
- **Mouse Support**: Enables mouse interaction (`set mouse=a`).
- **Search Behavior**:
  - Disables search highlight (`set nohls`).
  - Enables incremental search (`set incsearch`).

### Automatic Trailing Whitespace Removal
- Removes trailing whitespace upon saving files using an auto-command:
  ```vim
  autocmd BufWritePre * :%s/\s\+$//e
  ```

### Plugin Management
Uses `vim-plug` to manage various plugins that enhance Vim's functionality. Plugins included:
- **UI Enhancements**:
  - `vim-airline`: Status line for improved visibility.
  - `tokyonight.nvim`: Color scheme.
  - `nvim-web-devicons`: Icons support.
  - `oil.nvim`: File explorer replacement.
  - `vim-css-color`: CSS color preview.
  - `awesome-vim-colorschemes`: Collection of color schemes.
  - `markview.nvim`: Markdown preview.
  
- **Navigation & Productivity**:
  - `NERDTree`: File explorer.
  - `telescope.nvim`: Fuzzy finder for files, buffers, and more.
  - `tagbar`: Code navigation using ctags.
  - `vim-tmux-navigator`: Seamless navigation between Vim and tmux.
  
- **Syntax Highlighting & Code Editing**:
  - `nvim-treesitter`: Advanced syntax highlighting and parsing.
  - `treesitter-context`: Shows context at the top while scrolling.
  - `vimtex`: LaTeX support.
  - `vim-fugitive`: Git integration.
  - `vim-visual-multi`: Multi-cursor support.
  
#### Plugin Installation & Management
- **Install plugins**: `:PlugInstall`
- **Clean unused plugins**: `:PlugClean`
- **Update plugins**: `:UpdateRemotePlugins`

### Lua Configurations
Several plugins require additional Lua configurations, including:
- **Treesitter** for syntax highlighting and code parsing.
- **Telescope** for fuzzy finding.
- **Oil.nvim** for file navigation.
- **Treesitter Context** for displaying context while scrolling.

### Key Mappings
#### File Navigation
- `<C-f>`: Focus NERDTree.
- `<C-t>`: Toggle NERDTree.
- `<F8>`: Toggle Tagbar.
>Use the natural Vim navigation keys hjkl to navigate the files.
> - Press o to open the file in a new buffer or open/close directory.
> - Press t to open the file in a new tab. 
> - Press i to open the file in a new horizontal split.
> - Press I Toggle hidden files.
> - Press s to open the file in a new vertical split.
> - Press p to go to parent directory.
> - Press r to refresh the current directory.
> - Press R to refresh the current root.

- `<leader>so`: Save and reload `.vimrc`.

#### Search & Navigation
- `<C-d>`, `<C-u>`: Scrolls half a page and centers the cursor.
- `n`, `N`: Centers the cursor when navigating search results.

#### Editing Enhancements
- `J`: Joins lines while keeping the cursor in place.
- `dd`: Deletes a line without copying it to clipboard.
- `J`, `K` in visual mode: Moves selected text up/down.

#### Commenting
- `<leader>co`: Toggles comments in visual mode (supports `//`-style comments).

#### Telescope Commands
- `<leader>ff`: Find files.
- `<leader>fg`: Live grep.
- `<leader>fb`: List buffers.
- `<leader>fh`: Help tags.
- `<leader>gf`: Git files.
- `<leader>gc`: Git commits.
- `<leader>of`: Old files.

### Arrow Keys Disabled
- Arrow keys are disabled in normal and insert modes to encourage using `h`, `j`, `k`, `l` for movement.

### Color Scheme
- Uses `tokyonight-night` as the default color scheme.

## Installation & Setup
1. Install `vim-plug` if not already installed:
   ```sh
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \\
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
2. Copy this configuration to your `.vimrc` or `init.vim` (for Neovim).
3. Open Vim and run `:PlugInstall` to install plugins.
4. Restart Vim to apply changes.

## Notes
- The configuration is designed for both Vim and Neovim.
- Plugins requiring external dependencies (like `telescope.nvim` or `nvim-treesitter`) may need additional setup.
- The Lua-based configurations require Neovim for full functionality.

This setup optimizes Vim for a modern coding workflow with improved navigation, syntax highlighting, and customization options.

