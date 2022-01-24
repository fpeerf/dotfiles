local status_ok, dial = pcall(require, "dial")
if not status_ok then
	return
end

-- ≈ is <M-x>
vim.cmd([[
  nmap ≈ <Plug>(dial-increment)
  nmap <C-x> <Plug>(dial-decrement)
  vmap ≈ <Plug>(dial-increment)
  vmap <C-x> <Plug>(dial-decrement)
  vmap g≈ <Plug>(dial-increment-additional)
  vmap g<C-x> <Plug>(dial-decrement-additional)
  ]])

dial.augends["custom#boolean"] = dial.common.enum_cyclic({
	name = "boolean",
	strlist = { "true", "false" },
})
table.insert(dial.config.searchlist.normal, "custom#boolean")

-- For Languages which prefer True/False, e.g. python.
dial.augends["custom#Boolean"] = dial.common.enum_cyclic({
	name = "Boolean",
	strlist = { "True", "False" },
})
table.insert(dial.config.searchlist.normal, "custom#Boolean")
