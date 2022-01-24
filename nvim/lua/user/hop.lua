local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
hop.setup({
  case_insensitive = true,
  char2_fallback_key = '<CR>',
})
vim.api.nvim_set_keymap("", "f", ":HopChar2<cr>", { silent = true })
vim.api.nvim_set_keymap("", "S", ":HopWord<cr>", { silent = true })
