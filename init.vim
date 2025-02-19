set nowrap
set number
set relativenumber

set smartindent
set tabstop=8
set shiftwidth=8
set softtabstop=8
set expandtab

set mouse=a
set scrolloff=8

set nohls
set incsearch

filetype plugin indent on

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree' "
Plug 'folke/tokyonight.nvim'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
Plug 'christoomey/vim-tmux-navigator'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'https://github.com/mg979/vim-visual-multi', {'branch': 'master'}
Plug 'stevearc/oil.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'OXY2DEV/markview.nvim'
Plug 'nvim-treesitter/nvim-treesitter-context'

call plug#end()
" --------- plug commands ------------
"  PlugInstall - PlugClean - UpdateRemotePlugins

"lua << EOF
"print("Hello from lua")
"EOF

lua << STOP
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "lua", "vim", "objc", "json", "html", "rust", "c", "python", "markdown"},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})
require('telescope').setup{
  defaults = {},
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {}
}
require('nvim-web-devicons').setup {}
require('oil').setup {
    view_options = {
        show_hidden = true,
        icons = true,  -- Enable icons
    },
}

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  multiwindow = false, -- Enable multiwindow support.
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

STOP

let mapleader = " "
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

"Enable moving! amazing keymaps
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
"Enable the cursor to stay in place when you join lines
nnoremap <silent> J mzJ`z

nnoremap <silent> dd "_dd

"when doing ctrl+d and ctrl+u for halfpage jumping, the cursor stays in the middle
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz

"when searching and pressing next, it keeps the term in the middle
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

"inserting brackets and paranthesis
inoremap <silent> <C-b> {}<Left><CR><ESC>O
inoremap <silent> <C-k> ()<Left>

inoremap <silent> ± \

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>of <cmd>Telescope oldfiles<cr>

nnoremap <silent> <leader>so :w <CR> :source $MYVIMRC<CR>


" Function to toggle comments on selected lines
function! ToggleComment()
  let l:firstline = line("'<")
  let l:lastline = line("'>")
  let l:lines = getline(l:firstline, l:lastline)
  if len(filter(copy(l:lines), {_, val -> val =~ '^\/\/'})) == len(l:lines)
    " Uncomment lines
    execute l:firstline . ',' . l:lastline . 's/^\/\///'
  else
    " Comment lines
    execute l:firstline . ',' . l:lastline . 's/^/\/\//'
  endif
endfunction

" Mapping <leader>co to the toggle comment function
vnoremap <leader>co :<C-u>call ToggleComment()<CR>

" Using the block above instead - thanks gpt!
" Commenting out one or more lines in C files
"vnoremap <leader>co :s/^/\/\//<CR>
" Uncommenting one or more lines in C files
"vnoremap <leader>cu :s/^\/\/<CR>

" Turning off arrow keys until i am comfortable without
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" The following lines are for insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

:colorscheme tokyonight-night
