-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[:%s/\s\+$//e]],
})

-- Snacks Terminal Keybinds
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = nativeTermGroup,
  pattern = "term://*",
  callback = function(event)
    local buf = event.buf
    vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window", buffer = buf, nowait = true })
    vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Above Window", buffer = buf, nowait = true })
    vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode", buffer = buf, nowait = true })
  end,
})
