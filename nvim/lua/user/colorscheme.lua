-- vim.cmd [[
-- try
--   colorscheme darkplus
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

-- Nightfox config
local nightfox = require("nightfox")
nightfox.setup({
  -- fox = "nightfox",
  alt_nc = false,
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold",
  },
  inverse = {
    visual = true,
    search = false,
    match_paren = false,
  },
})
-- nightfox.load()

-- Good info on overriding colors: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
-- Note had to add the SpecialKey to keep highlight on yank working alongside the CursorLine override
vim.api.nvim_exec(
  [[
function! MyHighlights() abort
    " highlight CursorLine guifg=NONE guibg=#353A54
    " Removes the underline causes by enabling cursorline:
    highlight clear CursorLine
    " Sets the line numbering to red background:
    highlight CursorLineNr guifg=#FFFF00 gui=bold
    highlight YankColor ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71

    " For cursor colors
    highlight Cursor cterm=bold gui=bold guibg=#00c918 guifg=black
    highlight Cursor2 guifg=red guibg=red

    " For floating windows border highlight
    highlight FloatBorder guifg=LightGreen guibg=NONE

    " highlight for matching parentheses
    " highlight MatchParen cterm=bold,reverse,underline gui=bold,reverse,underline

    highlight CmpItemAbbr guifg=#9FA4B6
    highlight SpecialKey guibg=NONE
    highlight CmpItemKind guifg=#8289A0
    highlight CmpItemMenu guifg=#8289A0
    highlight PmenuSel guibg=#73daca guifg=#111111
    highlight Pmenu guibg=#2E3248
    highlight GitSignsAddNr guifg=#26A07A
    highlight GitSignsDeleteNr guifg=#E87D7D
    highlight GitSignsChangeNr guifg=#AD991F
endfunction
augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

autocmd vimenter * ++nested colorscheme nightfox
]],
  true
)
