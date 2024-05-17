vim.g.mapleader = " "
vim.g.maplocalleader = ' '
vim.wo.number = true
vim.wo.relativenumber = true
vim.diagnostic.config({
	virtual_text = false,
})
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local opts = {}
require("lazy").setup("plugins")


