" Colorscheme in vim script based on kanagawa, lua version
" https://github.com/rebelot/kanagawa.nvim
" Written by Andreas Nore <https://github.com/abnore>
hi clear
if exists("syntax_on")
  syntax reset
endif

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

let g:colors_name = "kanagawa"

" =========================
" Base colors (muted)
" =========================
hi Normal        guifg=#dcd7ba guibg=#1f1f28
hi NormalNC      guifg=#dcd7ba guibg=#1f1f28
hi EndOfBuffer   guifg=#1f1f28
hi NonText       guifg=#54546d
hi Whitespace    guifg=#54546d
hi SpecialKey    guifg=#727169

" =========================
" Cursor & selection
" =========================
hi Cursor        guifg=#1f1f28 guibg=#dcd7ba
hi CursorLine    guibg=#2a2a37
hi CursorColumn  guibg=#2a2a37
hi CursorLineNr  gui=bold      guifg=#e6c384 guibg=#2a2a37
hi LineNr        guifg=#54546d guibg=#2a2a37
hi Visual        guibg=#223249
hi VisualNOS     guibg=#223249
hi MatchParen    gui=bold      guifg=#e6c384

" =========================
" UI
" =========================
hi StatusLine    guifg=#c8c093 guibg=#16161d
hi StatusLineNC  guifg=#54546d guibg=#16161d
hi WinSeparator  guifg=#16161d
hi VertSplit     guifg=#16161d
hi TabLine       guifg=#938aa9 guibg=#16161d
hi TabLineSel    gui=bold      guifg=#c8c093 guibg=#2a2a37
hi TabLineFill   guibg=#1f1f28
hi Title         gui=bold      guifg=#7fb4ca
hi Directory     guifg=#7fb4ca

" =========================
" Search
" =========================
hi Search        guifg=#dcd7ba guibg=#2d4f67
hi IncSearch     guifg=#223249 guibg=#e6c384
hi CurSearch     gui=bold      guifg=#dcd7ba guibg=#2d4f67

" =========================
" Popup menu
" =========================
hi Pmenu         guifg=#dcd7ba guibg=#223249
hi PmenuSel      guibg=#2d4f67
hi PmenuSbar     guibg=#223249
hi PmenuThumb    guibg=#2d4f67

" =========================
" Messages
" =========================
hi ErrorMsg      guifg=#e46876
hi WarningMsg    guifg=#e6c384
hi MoreMsg       guifg=#658594
hi ModeMsg       gui=bold      guifg=#e6c384
hi Question      guifg=#658594

" =========================
" Diff
" =========================
hi DiffAdd       guibg=#2b3328
hi DiffChange    guibg=#252535
hi DiffDelete    guifg=#c34043 guibg=#43242b
hi DiffText      guibg=#49443c

" =========================
" Syntax
" =========================
hi Comment       gui=italic    guifg=#727169
hi Constant      guifg=#dca561
hi String        guifg=#98bb6c
hi Character     guifg=#98bb6c
hi Number        guifg=#d27e99
hi Boolean       gui=bold      guifg=#dca561
hi Identifier    guifg=#e6c384
hi Function      guifg=#7fb4ca
hi Statement     gui=bold     guifg=#957fb8
hi Keyword       gui=italic   guifg=#957fb8
hi Type          guifg=#7aa89f
hi Operator      guifg=#c0a36e
hi PreProc       guifg=#e46876
hi Special       guifg=#7fb4ca
hi Delimiter     guifg=#9cabca
hi Underlined    gui=underline guifg=#7fb4ca
hi Todo          gui=bold      guifg=#223249 guibg=#658594

" =========================
" Diagnostics (soft)
" =========================
hi DiagnosticError guifg=#e46876
hi DiagnosticWarn  guifg=#e6c384
hi DiagnosticInfo  guifg=#658594
hi DiagnosticHint  guifg=#6a9589

hi DiagnosticUnderlineError gui=undercurl guisp=#e46876
hi DiagnosticUnderlineWarn  gui=undercurl guisp=#e6c384
hi DiagnosticUnderlineInfo  gui=undercurl guisp=#658594
hi DiagnosticUnderlineHint  gui=undercurl guisp=#6a9589

" =========================
" Misc
" =========================
hi Folded        guifg=#938aa9 guibg=#2a2a37
hi FoldColumn    guifg=#54546d guibg=#2a2a37
hi SignColumn    guifg=#938aa9 guibg=#2a2a37
hi ColorColumn   guibg=#2a2a37
hi Conceal       guifg=#727169

" =========================
" Links
" =========================
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CursorLineSign SignColumn
hi! link CursorLineFold FoldColumn
hi! link WildMenu Pmenu
