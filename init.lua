local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ','

require("core.options-pre")
require("core.autocmds")

require("lazy").setup("plugins", {
  checker = { enabled = true },
  change_detection = { notify = false },
})

require("core.options-post")
require("core.keymaps")

