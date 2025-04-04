set nowrap
set relativenumber
set number

set smartindent

set mouse=a
set scrolloff=8

set nohls
set incsearch

set undofile        " Enable persistent undo
set undodir=~/.config/nvim/undo " Set directory for undo files

set lazyredraw
set updatetime=300

let g:c_syntax_for_h = 1

" Ensure filetype detection is on
filetype on
filetype plugin indent on

" Set tab width based on file type
augroup filetype_tab_settings
    autocmd!

    " Python and C use 4 spaces per tab
    autocmd FileType python,c,cpp,asm,objc setlocal tabstop=4 shiftwidth=4 expandtab

    " VHDL uses 2 spaces per tab
    autocmd FileType vhdl,vhd setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

if has("mac") || has("win32") || has("win64")
    set clipboard^=unnamedplus  " Use system clipboard on macOS/Windows
elseif has("unix")
    if executable("xclip") || executable("xsel")
        set clipboard^=unnamedplus  " Use system clipboard if xclip/xsel is installed
    else
        set clipboard^=unnamed      " Fallback to PRIMARY selection on X11
    endif
endif

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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'https://github.com/mg979/vim-visual-multi', {'branch': 'master'}
Plug 'stevearc/oil.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'projekt0n/github-nvim-theme'

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
    },
    colorscheme = {
      enable_preview = true, -- This makes it preview as you scroll
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

inoremap <silent> æ }
inoremap <silent> Æ ]
inoremap <silent> ø {
inoremap <silent> Ø [
inoremap <silent> Å \|
inoremap <silent> å \

nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>of <cmd>Telescope oldfiles<cr>

nnoremap <silent> <leader>so :w <CR> :source $MYVIMRC<CR>
nnoremap <silent> <leader>w :w <CR>
nnoremap <silent> <leader>q :q <CR>

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

:colorscheme tokyonight-night

