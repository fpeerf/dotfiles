-- vim.cmd [[
-- source ~/.config/nvim/lua/user/wilder.vim
-- ]]

vim.api.nvim_exec(
  [[
    function! s:wilder_init() abort
      try
        call wilder#setup({
              \ 'modes': [':', '/', '?'],
              \ })

        call wilder#set_option('pipeline', [
              \   wilder#branch(
              \     wilder#cmdline_pipeline({
              \       'language': 'python',
              \       'fuzzy': 1,
              \       'sorter': wilder#python_difflib_sorter(),
              \       'debounce': 30,
              \     }),
              \     wilder#python_search_pipeline({
              \       'pattern': wilder#python_fuzzy_pattern(),
              \       'sorter': wilder#python_difflib_sorter(),
              \       'engine': 're',
              \       'debounce': 30,
              \     }),
              \   ),
              \ ])

        let l:hl = wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}])
        call wilder#set_option('renderer', wilder#popupmenu_renderer({
              \ 'highlighter': wilder#basic_highlighter(),
              \ 'max_height': 15,
              \ 'highlights': {
              \   'accent': l:hl,
              \ },
              \ 'left': [' ', wilder#popupmenu_devicons(),],
              \ 'right': [' ', wilder#popupmenu_scrollbar(),],
              \ 'apply_incsearch_fix': 0,
              \ }))
      catch /^Vim\%((\a\+)\)\=:E117/
        echohl Error |echomsg "Wilder.nvim missing: run :PackerSync to fix."|echohl None
      endtry
    endfunction

    augroup wilder_init
      autocmd!
      " CursorHold is suggested here: https://github.com/gelguy/wilder.nvim/issues/89#issuecomment-934465957.
      autocmd CursorHold * ++once call s:wilder_init()
    augroup END
  ]],
  true
)
