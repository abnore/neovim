return {
  "vim-airline/vim-airline",
  dependencies = {
    "vim-airline/vim-airline-themes",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    vim.g.airline_powerline_fonts = 1
    vim.g.airline_theme = "angr"  -- or angr - minimalist
    vim.g.airline_left_sep = ""
    vim.g.airline_right_sep = ""
    vim.g.airline_section_c = "%<%f"
    vim.g.airline_section_z = "%l:%c"
    vim.g.airline_skip_empty_sections = 1
  end,
}

